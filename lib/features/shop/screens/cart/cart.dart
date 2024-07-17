import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/icons/t_circular_icon.dart';
import 'package:onedaytrip/common/widgets/images/t_rounded_image.dart';
import 'package:onedaytrip/common/widgets/products/cart/cart_item_paid.dart';
import 'package:onedaytrip/common/widgets/texts/product_price_text.dart';
import 'package:onedaytrip/common/widgets/texts/product_title_text.dart';
import 'package:onedaytrip/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:onedaytrip/features/shop/screens/cart/widget/cart_items.dart';
import 'package:onedaytrip/features/shop/screens/checkout/checkout.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';

import '../../../../api/fetch_api/check_out.dart';
import '../../../../api/global_variables/user_manage.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TAppBar(
//           showBackArrow: true,
//           title: Text('Order', style: Theme.of(context).textTheme.headlineSmall)),
//       body: const Padding(
//         padding: EdgeInsets.all(TSizes.defaultSpace),
//
//         /// -- Items in Cart
//         child: TCartItem(),
//       ),
//
//       /// Checkout Button
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child:
//             ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout \$256.0')),
//       ),
//     );
//   }
// }

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  Future<List<int>> fetchCartIds() async {
    final String? token = UserManager().token;
    final userId = UserManager().id;
    print("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000$userId");
    print("999999999999999999999999999999999999999999999999999999999999999999$token");
    final response = await http.post(
      Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/order/find-all-sale-for-user/$userId?page=1&limit=10"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print("99999999999999999999999999999999999999999999999999999999999999999$response");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['content'];
      return data.map((item) => item['id'] as int).toList();
    } else {
      throw Exception('Failed to load cart IDs');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = UserManager().id;  // Ensure userId is non-null and convert it to int

    final checkout = Checkout(id: userId!);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItem(), // Pass the user ID here
      ),
      // body: FutureBuilder<List<int>>(
      //   future: checkout.fetchCartIds(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Center(child: Text('No items in cart'));
      //     } else {
      //       final ids = snapshot.data!;
      //
      //       return ListView.builder(
      //         itemCount: ids.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text('Package ID: ${ids[index]}'),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder<List<int>>(
          future: checkout.fetchCartIds(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink(); // Hoặc hiển thị một CircularProgressIndicator
            }

            final ids = snapshot.data!;

            return ElevatedButton(
              onPressed: () async {
                try {
                  // Gọi API để lưu thông tin
                  await checkout.confirmOrder(ids);

                  // Chuyển đến màn hình Checkout nếu lưu thành công
                  Get.to(() => const CheckoutScreen());
                } catch (e) {
                  // Xử lý lỗi nếu có
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Failed to confirm order. Please try again later.'),
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
              },
              child: Text('Checkout'),
            );
          },
        ),
      ),
    );
  }
}