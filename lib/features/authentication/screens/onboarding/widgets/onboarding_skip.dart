import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:onedaytrip/features/authentication/screens/login/login.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: () =>
      Get.to(() => const LoginScreen())
          // OnBoardingController.instance.skipPage()
          , child: const Text('Skip')),
    );
  }
}
