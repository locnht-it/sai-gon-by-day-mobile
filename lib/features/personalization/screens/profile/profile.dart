// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
// import 'package:onedaytrip/common/widgets/images/t_circular_image.dart';
// import 'package:onedaytrip/common/widgets/texts/section_heading.dart';
// import 'package:onedaytrip/features/personalization/screens/profile/widget/profile_menu.dart';
// import 'package:onedaytrip/features/personalization/screens/settings/settings.dart';
// import 'package:onedaytrip/utils/constants/image_strings.dart';
// import 'package:onedaytrip/utils/constants/sizes.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TAppBar(showBackArrow: true, title: Text('Profile')),
//
//       /// -- Body
//       body: SingleChildScrollView(
//         child: Padding(
//             padding: EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Profile Picture
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     const TCircularImage(image: TImages.user, width: 80, height: 80),
//                     TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
//                   ],
//                 ),
//               ),
//
//               /// Details
//               const SizedBox(height: TSizes.spaceBtwItems / 2),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               /// Heading Profile Info
//               const TSectionHeading(title: 'Profile Information', showActionButton: false),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               TProfileMenu(onPressed: (){}, title: 'Name', value: 'Coding with TPP'),
//               TProfileMenu(onPressed: (){}, title: 'Username', value: 'coding_with_tpp'),
//
//               const SizedBox(height: TSizes.spaceBtwItems),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               /// Heading Personal Info
//               const TSectionHeading(title: 'Personal Information', showActionButton: false),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               TProfileMenu(onPressed: (){}, icon: Iconsax.copy, title: 'User code', value: '456789'),
//               TProfileMenu(onPressed: (){}, title: 'E-mail', value: 'namlee@gmail.com'),
//               TProfileMenu(onPressed: (){}, title: 'Phone Number', value: '+84-183-231232'),
//               TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
//               TProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '18 May, 2003'),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               Center(
//                 child: TextButton(onPressed: () => Get.to(() => const SettingsScreen()), child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/images/t_circular_image.dart';
import 'package:onedaytrip/common/widgets/texts/section_heading.dart';
import 'package:onedaytrip/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:onedaytrip/features/personalization/screens/settings/settings.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:http/http.dart' as http;
import '../../../../api/global_variables/user_manage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, dynamic>> fetchUserProfile() async {
    final int? userId = UserManager().id;

    final response = await http.get(
      Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/user/find-id/$userId"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['content'];
    } else {
      throw Exception('Failed to load user profile: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder<Map<String, dynamic>>(
            future: fetchUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No user data found'));
              }

              final user = snapshot.data!;

              return Column(
                children: [
                  /// Profile Picture
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const TCircularImage(image: TImages.user, width: 80, height: 80),
                        TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                      ],
                    ),
                  ),

                  /// Details
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Heading Profile Info
                  const TSectionHeading(title: 'Profile Information', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TProfileMenu(onPressed: (){}, title: 'Name', value: user['fullname'] ?? 'N/A'),
                  TProfileMenu(onPressed: (){}, title: 'Address', value: user['address'] ?? 'N/A'),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Heading Personal Info
                  const TSectionHeading(title: 'Personal Information', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TProfileMenu(onPressed: (){}, icon: Iconsax.copy, title: 'Role', value: user['role'] ?? 'N/A'),
                  TProfileMenu(onPressed: (){}, title: 'E-mail', value: user['email'] ?? 'N/A'),
                  TProfileMenu(onPressed: (){}, title: 'Phone Number', value: user['phone'] ?? 'N/A'),
                  TProfileMenu(onPressed: (){}, title: 'Gender', value: user['gender']?.toUpperCase() ?? 'N/A'),
                  // TProfileMenu(onPressed: (){}, title: 'Date of Birth', value: user['dob'] ?? 'N/A'),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Center(
                    child: TextButton(
                      onPressed: () => Get.to(() => const SettingsScreen()),
                      child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
