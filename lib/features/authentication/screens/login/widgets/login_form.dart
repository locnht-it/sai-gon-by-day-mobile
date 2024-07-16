import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/api/auth/push_notification_service.dart';
import 'package:onedaytrip/api/global_variables/fcm_token_manage.dart';
import 'package:onedaytrip/api/global_variables/user_manage.dart';
import 'package:onedaytrip/api/request/sign_in_request.dart';
import 'package:onedaytrip/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:onedaytrip/features/authentication/screens/signup/signup.dart';
import 'package:onedaytrip/features/authentication/screens/signup/verify_email.dart';
import 'package:onedaytrip/navigation_menu.dart';
import 'package:http/http.dart' as http;
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  _TLoginFormState createState() => _TLoginFormState();
}
class _TLoginFormState extends State<TLoginForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserManager userManager = UserManager();
  bool _showPassword = false;
  Future<void> _signIn(BuildContext context) async {
    try {
      // Tạo SignInRequest từ dữ liệu người dùng nhập vào
      SignInRequest request = SignInRequest(
        login: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );


      // Gửi yêu cầu POST đến API
      var response = await http.post(
        Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      // Xử lý phản hồi từ API
      if (response.statusCode == 200) {
        // Phản hồi thành công, xử lý dữ liệu từ server ở đây
        var responseData = jsonDecode(response.body);
        var userDTO = responseData['content']['userDTO'];
        var token = responseData['content']['token'];

        userManager.id = userDTO['id'];
        userManager.email = userDTO['email'];
        userManager.role = userDTO['role'];
        userManager.token = token;
        String? fcmToken = TokenManager().fcmToken;

        // Send notification using PushNotificationService
        // await PushNotificationService.sendNotificationToSelectedDrived(
        //   fcmToken,
        //   context
        // );

print("00000000000000000000000000000000000000000000000000000000000");
        // Hiển thị dialog hoặc thực hiện hành động phù hợp sau khi đăng nhập thành công
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign in successfully'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('ID: ${userDTO['id']}'),
                  Text('Email: ${userDTO['email']}'),
                  Text('Role: ${userDTO['role']}'),
                  Text('Token: $token'),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigate to another screen or perform another action
                    Get.to(() => const NavigationMenu());
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Phản hồi lỗi từ API, hiển thị thông báo lỗi
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to sign in. Please try again later.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Xử lý lỗi trong quá trình gửi yêu cầu
      print('Error occurred during sign-in: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(TSizes.borderRadiusMd)),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              obscureText: !_showPassword,
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword ? Iconsax.eye : Iconsax.eye_slash,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(TSizes.borderRadiusMd)),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _signIn(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                  ),
                ),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()) ,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                  ),
                ),
                child: const Text(TTexts.createAccount),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
