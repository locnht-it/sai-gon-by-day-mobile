import 'package:flutter/material.dart';
import 'package:onedaytrip/api/global_variables/user_manage.dart';
import 'package:onedaytrip/features/authentication/screens/signup/widgets/fill_info_signup_google_form.dart';
import 'package:onedaytrip/features/authentication/screens/signup/widgets/fill_info_signup_google_header.dart';
import 'package:onedaytrip/utils/constants/colors.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';



class FillInforSignupGoogle extends StatelessWidget {
  const FillInforSignupGoogle({super.key});
  static final ValueNotifier<String?> _selectedGender = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue background with image
          Container(
            height: 400,
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
                    const TFillInfoSignUpGoogleHeader(),
                    const SizedBox(height: TSizes.xl),

                    /// Form
                    TFillInfoSignUpGoogleForm(selectedGender: _selectedGender),
                    const SizedBox(height: TSizes.spaceBtwSections),
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