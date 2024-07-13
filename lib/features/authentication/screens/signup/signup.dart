import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:onedaytrip/features/authentication/screens/signup/widgets/signup_header.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/image_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static final ValueNotifier<String?> _selectedGender = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue background with image
          Container(
            height: 300,
            color: TColors.primary, // Blue background color
            child: const Center(
              child: Image(
                height: 250, // Increase the height to make the image larger
                image: AssetImage(TImages.signupImage),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSignupHeader(),
                    const SizedBox(height: TSizes.xl),

                    /// Form
                    TSignupForm(selectedGender: _selectedGender),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Divider
                    TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Social Buttons
                    TSocialButtons(),
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