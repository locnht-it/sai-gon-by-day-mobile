import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/otp_verification/otp_verification.dart';
import 'package:onedaytrip/common/widgets/otp_verification/otp_verification_reset.dart';
import 'package:onedaytrip/features/authentication/screens/login/login.dart';
import 'package:onedaytrip/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/constants/text_strings.dart';

class CreateNewpass extends StatelessWidget {
  const CreateNewpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(TTexts.createNewPassTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.createNewPassSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections * 2),


            /// Text fields
            TextFormField(
              decoration: const InputDecoration(labelText: TTexts.password, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              decoration: const InputDecoration(labelText: TTexts.conPassword, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () =>
                  Get.to(() => const ResetPassword()), child: const Text(TTexts.create),
                // Get.off(() => const ResetPassword()), child: const Text(TTexts.submit)
              ),
            )
          ],
        ),
      ),
    );
  }
}
