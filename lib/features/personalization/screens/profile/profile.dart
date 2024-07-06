import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/images/t_circular_image.dart';
import 'package:onedaytrip/common/widgets/texts/section_heading.dart';
import 'package:onedaytrip/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
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

              TProfileMenu(onPressed: (){}, title: 'Name', value: 'Coding with TPP'),
              TProfileMenu(onPressed: (){}, title: 'Username', value: 'coding_with_tpp'),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(onPressed: (){}, icon: Iconsax.copy, title: 'User code', value: '456789'),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: 'namlee@gmail.com'),
              TProfileMenu(onPressed: (){}, title: 'Phone Number', value: '+84-183-231232'),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '18 May, 2003'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              
              Center(
                child: TextButton(onPressed: (){}, child: const Text('Close Account', style: TextStyle(color: Colors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
