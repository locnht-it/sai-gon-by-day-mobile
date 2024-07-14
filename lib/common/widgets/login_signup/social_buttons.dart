import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onedaytrip/features/authentication/screens/signup/fill_infor_signup_google.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  TSocialButtons({super.key});

  // Initialize FirebaseAuth and GoogleSignIn instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      // Start the Google Sign-In process
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtain the authentication details from the request
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        // Create a new credential using the obtained details
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        // Sign in with the created credential
        UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

        // Check if sign-in was successful
        if (userCredential.user != null) {
          // Get the OAuth2AuthenticationToken
          String? email = userCredential.user?.email;

          // Call your API with the email
          var response = await http.post(
            Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/auth/signingoogle?email=$email'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({'email': email}),
          );

          // Check for success
          if (response.statusCode == 200) {
            // Parse the response
            var responseData = jsonDecode(response.body);
            var userDTO = responseData['content']['userDTO'];
            var token = responseData['content']['token'];

            // Show the response in a dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Sign in successfully'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('ID: ${userDTO['id']}'),
                      Text('Full Name: ${userDTO['fullname']}'),
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
                      },
                    ),
                  ],
                );
              },
            );

            // Navigate to the FillInforSignupGoogle page on successful sign-in
            //Get.to(() => FillInforSignupGoogle());
          } else {
            // Show an error dialog if the API call was unsuccessful
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('API Error'),
                  content: Text('Failed to sign in with Google. Please try again later.'),
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
        } else {
          print('Sign-in failed: UserCredential is null');
          Get.snackbar(
            'Error',
            'Sign-in failed: UserCredential is null',
            snackPosition: SnackPosition.TOP,
            //backgroundColor: Colors.white,
            colorText: Colors.red,
          );
        }
      } else {
        print('Google sign-in aborted');
        Get.snackbar(
          'Error',
          'Google sign-in aborted',
          snackPosition: SnackPosition.TOP,
          //backgroundColor: Colors.white,
          colorText: Colors.red,
        );
      }
    } catch (e) {
      // Handle sign-in errors
      print('Error occurred during Google sign-in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => _signInWithGoogle(context),
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}

