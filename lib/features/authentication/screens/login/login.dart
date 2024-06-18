// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:onedaytrip/common/widgets.login_signup/social_buttons.dart';
// import 'package:onedaytrip/features/authentication/screens/login/widgets/login_form.dart';
// import 'package:onedaytrip/features/authentication/screens/login/widgets/login_header.dart';
// import 'package:onedaytrip/utils/constants/colors.dart';
// import 'package:onedaytrip/utils/constants/image_strings.dart';
// import 'package:onedaytrip/utils/constants/sizes.dart';
// import 'package:onedaytrip/utils/constants/text_strings.dart';
// import 'package:onedaytrip/utils/helpers/helper_functions.dart';
//
// import '../../../../common/widgets.login_signup/form_divider.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start, // Align to the start
//             children: [
//               const SizedBox(height: TSizes.lg),
//               // Logo, Title & Sub-Title
//               const TLoginHeader(),
//               const SizedBox(height: TSizes.xl),
//
//               // Form
//               const TLoginForm(),
//
//               // Divider
//               TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
//               const SizedBox(height: TSizes.spaceBtwSections),
//
//               // Footer
//               const TSocialButtons(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:onedaytrip/common/widgets.login_signup/social_buttons.dart';
import 'package:onedaytrip/features/authentication/screens/login/widgets/login_form.dart';
import 'package:onedaytrip/features/authentication/screens/login/widgets/login_header.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';

import '../../../../common/widgets.login_signup/form_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue background with image
          Container(
            height: 300,
            color: Colors.blue, // Blue background color
            child: const Center(
              child: Image(
                height: 250, // Increase the height to make the image larger
                image: AssetImage(TImages.loginImage),
              ),
            ),
          ),
          // Form container
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 200), // Space from top to overlay the form
                padding: const EdgeInsets.all(TSizes.md),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TLoginHeader(),
                    SizedBox(height: TSizes.xl),

                    // Form
                    TLoginForm(),

                    // Divider
                    TFormDivider(dividerText: 'OR'),
                    SizedBox(height: TSizes.md),

                    // Footer
                    TSocialButtons(),
                    SizedBox(height: TSizes.lg), // Add some bottom padding
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
