// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:onedaytrip/features/authentication/screens/signup/fill_infor_signup_google.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/image_strings.dart';
// import '../../../utils/constants/sizes.dart';
//
// class TSocialButtons extends StatelessWidget {
//   const TSocialButtons({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: TColors.grey),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: IconButton(
//             onPressed: () => Get.to(() => const FillInforSignupGoogle()),
//             icon: const Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(TImages.google),
//             ),
//           ),
//         ),
//         const SizedBox(width: TSizes.spaceBtwItems),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: TColors.grey),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: IconButton(
//             onPressed: () {},
//             icon: const Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(TImages.facebook),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:onedaytrip/features/authentication/screens/signup/fill_infor_signup_google.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/image_strings.dart';
// import '../../../utils/constants/sizes.dart';
//
// class TSocialButtons extends StatelessWidget {
//   const TSocialButtons({super.key});
//
//   void _launchURL(BuildContext context) async {
//     const url = "https://trip-by-day-backend.onrender.com/oauth2/authorization/google";
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch $url')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: TColors.grey),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: IconButton(
//             onPressed: () => _launchURL(context),
//             icon: const Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(TImages.google),
//             ),
//           ),
//         ),
//         const SizedBox(width: TSizes.spaceBtwItems),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: TColors.grey),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: IconButton(
//             onPressed: () {},
//             icon: const Image(
//               width: TSizes.iconMd,
//               height: TSizes.iconMd,
//               image: AssetImage(TImages.facebook),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:onedaytrip/features/authentication/screens/signup/fill_infor_signup_google.dart';
import '../../../api/firebase/global_variables/user_manager.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import 'dart:convert'; // Thêm import này để sử dụng jsonDecode

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  void _launchURL(BuildContext context) async {
    const url = "https://trip-by-day-backend.onrender.com/oauth2/authorization/google";
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      // Nếu thành công trong việc mở URL, lắng nghe phản hồi
      // Bạn có thể sử dụng một package như uni_links hoặc receive_sharing_intent để xử lý URL trở về.
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  Future<void> _handleCallback(Uri uri) async {
    // Giả sử callback trả về là: "https://yourapp.com/callback?userId=1&userEmail=test@example.com"
    final queryParams = uri.queryParameters;
    final userId = queryParams['userId'];
    final userEmail = queryParams['userEmail'];

    if (userId != null && userEmail != null) {
      UserManager().id = int.parse(userId);
      UserManager().email = userEmail;

      // Chuyển đến trang FillInforSignupGoogle
      Get.to(() => const FillInforSignupGoogle());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => _launchURL(context),
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
