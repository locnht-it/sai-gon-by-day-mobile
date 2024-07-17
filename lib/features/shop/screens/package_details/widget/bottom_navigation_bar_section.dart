
//
// class BottomNavigationBarSection extends StatelessWidget {
//   const BottomNavigationBarSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black, // Set background color to black
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             '\$80 person',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white, // Set text color to white
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => Get.to(() => const CheckoutScreen()),
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//             child: const Text(
//               'Book Now',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:onedaytrip/api/global_variables/user_manage.dart';
import 'package:onedaytrip/features/shop/screens/cart/cart.dart';

import '../../checkout/checkout.dart';
//
// class BottomNavigationBarSection extends StatefulWidget {
//   final int packageId;
//
//   const BottomNavigationBarSection({Key? key, required this.packageId}) : super(key: key);
//
//   @override
//   _BottomNavigationBarSectionState createState() => _BottomNavigationBarSectionState();
// }
//
// class _BottomNavigationBarSectionState extends State<BottomNavigationBarSection> {
//   double price = 0.0; // Define the price as a double
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPackageDetail();
//   }
//
//   Future<void> fetchPackageDetail() async {
//     final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
//     final String? token = UserManager().token;
//
//     try {
//       final response = await http.get(Uri.parse(url), headers: {
//         'Authorization': 'Bearer $token',
//       });
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['content'];
//         setState(() {
//           price = data['price'] != null ? (data['price'] as num).toDouble() : 0.0; // Update the price
//         });
//       } else {
//         print('Error: ${response.statusCode}');
//         throw Exception('Failed to load package detail');
//       }
//     } catch (e) {
//       print('Exception: $e');
//       throw Exception('Failed to load package detail');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black, // Set background color to black
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '\$$price / package', // Use the dynamic price value
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white, // Set text color to white
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => Get.to(() => const CartScreen()),
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//             child: const Text(
//               'Add To Cart',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BottomNavigationBarSection extends StatefulWidget {
  final int packageId;

  const BottomNavigationBarSection({Key? key, required this.packageId}) : super(key: key);

  @override
  _BottomNavigationBarSectionState createState() => _BottomNavigationBarSectionState();
}

class _BottomNavigationBarSectionState extends State<BottomNavigationBarSection> {
  double price = 0.0;

  @override
  void initState() {
    super.initState();
    fetchPackageDetail();
  }

  Future<void> fetchPackageDetail() async {
    final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
    final String? token = UserManager().token;

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['content'];
        setState(() {
          price = data['price'] != null ? (data['price'] as num).toDouble() : 0.0;
        });
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to load package detail');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load package detail');
    }
  }

  Future<void> addToCart() async {
    final String url = "https://trip-by-day-backend.onrender.com/api/v1/order/save";
    final String? token = UserManager().token;
    final int? userId = UserManager().id;

    final Map<String, dynamic> requestBody = {
      "userId": userId,
      "packageInDayIds": [widget.packageId]
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response: $data');
        Get.to(() => const CartScreen());
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to add to cart');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to add to cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: addToCart,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Add To Cart',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}