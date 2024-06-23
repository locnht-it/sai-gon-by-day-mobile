import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/otp_verification/otp_verification.dart';
import 'package:onedaytrip/common/widgets/success_screen/success_screen.dart';
import 'package:onedaytrip/features/authentication/screens/login/login.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/constants/text_strings.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Image
                Image(image: const AssetImage(TImages.verifyEmailImage), width: THelperFunctions.screenWidth() * 0.6),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Title & Sub-title
                Text(TTexts.confirmEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text('support@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Email
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                /// Buttons
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => OtpVerificationScreen()),
                //     SuccessScreen(
                //   image: TImages.verifyEmailSuccess,
                //   title: TTexts.yourAccountCreatedTitle,
                //   subTitle: TTexts.yourAccountCreatedSubTitle,
                //   onPressed: () => Get.to(() => const LoginScreen()),
                // ),),
                    child: const Text(TTexts.tContinue)),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail))),
              ],
            ),
        ),
      ),
    );
  }
}
