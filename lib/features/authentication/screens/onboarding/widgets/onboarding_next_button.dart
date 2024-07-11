import 'package:flutter/material.dart';
import 'package:onedaytrip/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = THelperFunctions.screenHeight();
    final screenWidth = THelperFunctions.screenWidth();
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 45,
      left: 0,
      right: 0,
      child: Center(
        // mainAxisAlignment: MainAxisAlignment.center,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: dark ? TColors.primary : Colors.black,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.3,
              vertical: screenHeight * 0.02,
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}