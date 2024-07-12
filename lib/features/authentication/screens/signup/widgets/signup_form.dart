// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:onedaytrip/features/authentication/screens/login/login.dart';
// import 'package:onedaytrip/features/authentication/screens/signup/verify_email.dart';
//
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/constants/text_strings.dart';
//
// class TSignupForm extends StatelessWidget {
//   const TSignupForm({
//     super.key,
//     required ValueNotifier<String?> selectedGender,
//   }) : _selectedGender = selectedGender;
//
//   final ValueNotifier<String?> _selectedGender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           // Row(
//           //   children: [
//           //     Expanded(
//           //       child: TextFormField(
//           //         expands: false,
//           //         decoration: const InputDecoration(
//           //             labelText: TTexts.firstName,
//           //             prefixIcon: Icon(Iconsax.user)),
//           //       ),
//           //     ),
//           //     const SizedBox(width: TSizes.spaceBtwInputFields),
//           //     Expanded(
//           //       child: TextFormField(
//           //         expands: false,
//           //         decoration: const InputDecoration(
//           //             labelText: TTexts.lastName,
//           //             prefixIcon: Icon(Iconsax.user)),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Fullname
//           TextFormField(
//             expands: false,
//             decoration: const InputDecoration(
//                 labelText: TTexts.fullName,
//                 prefixIcon: Icon(Iconsax.user)),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           // /// Email
//           // TextFormField(
//           //   decoration: const InputDecoration(
//           //       labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
//           // ),
//           // const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Phone Number
//           TextFormField(
//             decoration: const InputDecoration(
//                 labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Address
//           TextFormField(
//             expands: false,
//             decoration: const InputDecoration(
//                 labelText: TTexts.address, prefixIcon: Icon(Iconsax.location)),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Gender Dropdown
//           ValueListenableBuilder<String?>(
//             valueListenable: _selectedGender,
//             builder: (context, value, child) {
//               return DropdownButtonFormField<String>(
//                 value: value,
//                 onChanged: (String? newValue) {
//                   _selectedGender.value = newValue;
//                 },
//                 items: <String>['Male', 'Female', 'Other']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: const InputDecoration(
//                   labelText: 'Gender',
//                   prefixIcon: Icon(Iconsax.user),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Password
//           TextFormField(
//             obscureText: true,
//             decoration: const InputDecoration(
//               labelText: TTexts.password,
//               prefixIcon: Icon(Iconsax.password_check),
//               suffixIcon: Icon(Iconsax.eye_slash),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Confirm Password
//           TextFormField(
//             obscureText: true,
//             decoration: const InputDecoration(
//               labelText: TTexts.conPassword,
//               prefixIcon: Icon(Iconsax.password_check),
//               suffixIcon: Icon(Iconsax.eye_slash),
//             ),
//           ),
//           const SizedBox(height: TSizes.spaceBtwSections),
//
//           /// Sign Up Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//                 onPressed: () => Get.to(() => const LoginScreen()), child: const Text(TTexts.createAccount)),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:onedaytrip/features/authentication/screens/login/login.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatefulWidget {
  final int userId;
  final String userEmail;

  const TSignupForm({
    super.key,
    required this.userId,
    required this.userEmail,
    required ValueNotifier<String?> selectedGender,
  }) : _selectedGender = selectedGender;

  final ValueNotifier<String?> _selectedGender;

  @override
  _TSignupFormState createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> saveUserInfo() async {
    final url = 'https://trip-by-day-backend.onrender.com/api/v1/auth/save-infor';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = jsonEncode({
      'email': widget.userEmail,
      'fullname': _fullnameController.text,
      'phone': _phoneController.text,
      'password': _passwordController.text,
      'address': _addressController.text,
      'gender': widget._selectedGender.value?.toUpperCase(), // Chuyển đổi thành chữ hoa
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        print('User information saved successfully');
        Get.to(() => const LoginScreen());
      } else {
        print('Failed to save user information');
        Get.snackbar('Error', 'Failed to save user information: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      Get.snackbar('Error', 'An error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Fullname
          TextFormField(
            controller: _fullnameController,
            decoration: const InputDecoration(
              labelText: TTexts.fullName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Address
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(
              labelText: TTexts.address,
              prefixIcon: Icon(Iconsax.location),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Gender Dropdown
          ValueListenableBuilder<String?>(
            valueListenable: widget._selectedGender,
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                value: value,
                onChanged: (String? newValue) {
                  widget._selectedGender.value = newValue;
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  prefixIcon: Icon(Iconsax.user),
                ),
              );
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Confirm Password
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.conPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_passwordController.text == _confirmPasswordController.text) {
                  saveUserInfo();
                } else {
                  Get.snackbar('Error', 'Passwords do not match');
                }
              },
              child: const Text(TTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
