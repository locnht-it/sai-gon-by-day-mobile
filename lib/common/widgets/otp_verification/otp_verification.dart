import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../success_screen/success_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color to blue
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              TImages.signupImage,
              fit: BoxFit.cover,
            ),
          ),

          // White Form Container
          Positioned.fill(
            top: 200,
            child: Container(
              padding: const EdgeInsets.all(TSizes.md),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                      child: Text(
                        TTexts.otpVerificationTitle,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                      child:
                      Text(
                        TTexts.otpVerificationSubTitle,
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // OTP input fields (Example)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index) {
                        return const SizedBox(
                          width: 50,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Timer and Resend OTP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.md),
                          child:
                        Text(
                          'Time Remaining 00:${_start.toString().padLeft(2, '0')}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Resend OTP logic here
                          },
                          child: const Text(
                            TTexts.resendOTP,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

              // Verification button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() =>
                              SuccessScreen(
                            image: TImages.verifyEmailSuccess,
                            title: TTexts.yourAccountCreatedTitle,
                            subTitle: TTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),),
                        child: const Text(TTexts.verificationButton),
                      ),
                    ),
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
