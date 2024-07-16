import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/api/global_variables/fcm_token_manage.dart';
import 'package:onedaytrip/api/global_variables/user_manage.dart';
import 'package:onedaytrip/features/shop/screens/home/home.dart';
import 'package:onedaytrip/navigation_menu.dart';
import 'package:http/http.dart' as http;
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';


class TFillInfoSignUpGoogleForm extends StatefulWidget {
  const TFillInfoSignUpGoogleForm({
    super.key,
    required this.selectedGender
});
  final ValueNotifier<String?> selectedGender;

  @override
  TFillInfoSignUpGoogleFormState createState() => TFillInfoSignUpGoogleFormState();
}


class TFillInfoSignUpGoogleFormState extends State<TFillInfoSignUpGoogleForm> {

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final String _baseUrl = 'https://trip-by-day-backend.onrender.com/api/v1/auth/save-infor-google';
  UserManager userManager = UserManager();
  Future<void> _signup() async {
    final String? email = userManager.email;
    final String fullname = _fullnameController.text;
    final String phone = _phoneController.text;
    final String address = _addressController.text;
    final String gender = widget.selectedGender.value ?? 'Other';
    final fcmtoken = TokenManager().fcmToken;

    if (fullname.isEmpty || phone.isEmpty || address.isEmpty || gender.isEmpty) {
      Get.snackbar(
        'Error',
        'Please input all fields',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
      );
      return; // Dừng hàm nếu có bất kỳ trường nào trống
    }

    final Map<String, dynamic> data = {
      'email': email,
      'fullname': fullname,
      'phone': phone,
      'address': address,
      'gender': gender.toUpperCase(),
      'FCMToken': fcmtoken, // Thay thế bằng FCM token thực tế của bạn
    };

    print("Đây là data aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa: $data");
    print(fullname);
    print(phone);
    print(address);
    print(gender);
    print(fcmtoken);

    final Uri url = Uri.parse(_baseUrl);


    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        //Get.to(() => const NavigationMenu());
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sign Up Successful'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Email: '),
                    Text('Full Name: $fullname'),
                    Text('Phone: $phone'),
                    Text('Address: $address'),
                    Text('Gender: $gender'),
                    Text('FCM Token: $fcmtoken'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Get.to(() => const LoginScreen());
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Xử lý khi API thất bại
        Get.snackbar('Error', 'Failed to sign up: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý lỗi kết nối
      Get.snackbar('Error', 'Failed to connect to the server: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextFormField(
          //         expands: false,
          //         decoration: const InputDecoration(
          //             labelText: TTexts.firstName,
          //             prefixIcon: Icon(Iconsax.user)),
          //       ),
          //     ),
          //     const SizedBox(width: TSizes.spaceBtwInputFields),
          //     Expanded(
          //       child: TextFormField(
          //         expands: false,
          //         decoration: const InputDecoration(
          //             labelText: TTexts.lastName,
          //             prefixIcon: Icon(Iconsax.user)),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Fullname
          TextFormField(
            expands: false,
            controller: _fullnameController,
            decoration: const InputDecoration(
                labelText: TTexts.fullName,
                prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // /// Email
          // TextFormField(
          //   decoration: const InputDecoration(
          //       labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          // ),
          // const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Address
          TextFormField(
            expands: false,
            controller: _addressController,
            decoration: const InputDecoration(
                labelText: TTexts.address, prefixIcon: Icon(Iconsax.location)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Gender Dropdown
          ValueListenableBuilder<String?>(
            valueListenable: widget.selectedGender,
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                value: value,
                onChanged: (String? newValue) {
                  widget.selectedGender.value = newValue;
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


          /// Create Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _signup,
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
