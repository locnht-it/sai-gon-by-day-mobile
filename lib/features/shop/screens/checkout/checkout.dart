import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/api/fetch_api/check_out.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:onedaytrip/common/widgets/products/cart/cart_item.dart';
import 'package:onedaytrip/common/widgets/products/cart/cart_item_paid.dart';
import 'package:onedaytrip/common/widgets/success_screen/success_screen.dart';
import 'package:onedaytrip/features/shop/screens/cart/widget/cart_items.dart';
import 'package:onedaytrip/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:onedaytrip/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:onedaytrip/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:onedaytrip/navigation_menu.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';

import '../../../../api/global_variables/user_manage.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import 'package:http/http.dart' as http;
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  Future<List<int>> fetchCartPaidIds() async {
    final String? token = UserManager().token;
    final userId = UserManager().id;
    print("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000$userId");
    print("999999999999999999999999999999999999999999999999999999999999999999$token");
    final response = await http.post(
      Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/order/find-all-confirm-for-user/$userId?page=1&limit=10"),
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
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              TCartItemPaid(),
              SizedBox(height: TSizes.spaceBtwSections),

              // /// -- Coupon TextField
              // TCouponCode(),
              // const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // /// Pricing
                    // TBillingAmountSection(),
                    // SizedBox(height: TSizes.spaceBtwItems),
                    //
                    // /// Divider
                    // Divider(),
                    // SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    //TBillingPaymentSection(),
                    //SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(TSizes.defaultSpace),
      //   child: ElevatedButton(
      //       onPressed: () => Get.to(() => SuccessScreen(
      //           image: TImages.paymentSuccess,
      //           title: 'Payment Success!',
      //           subTitle: 'Your package is ready!',
      //           onPressed: () => Get.offAll(() => const NavigationMenu()),
      //       ),
      //       ),
      //       child: Text('Checkout')),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder<List<int>>(
          future: checkout.fetchCartPaidIds(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink(); // Hoặc hiển thị một CircularProgressIndicator
            }

            final ids = snapshot.data!;

            return ElevatedButton(
              onPressed: () async {
                try {
                  // Gọi API để lưu thông tin
                  await checkout.paidOrder(ids, context);

                  // Chuyển đến màn hình SuccessScreen nếu lưu thành công
                  Get.to(() => SuccessScreen(
                    image: TImages.paymentSuccess,
                    title: 'Payment Success!',
                    subTitle: 'Your package is ready!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ));
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
