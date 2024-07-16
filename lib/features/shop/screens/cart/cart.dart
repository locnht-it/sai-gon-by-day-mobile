import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/icons/t_circular_icon.dart';
import 'package:onedaytrip/common/widgets/images/t_rounded_image.dart';
import 'package:onedaytrip/common/widgets/texts/product_price_text.dart';
import 'package:onedaytrip/common/widgets/texts/product_title_text.dart';
import 'package:onedaytrip/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:onedaytrip/features/shop/screens/cart/widget/cart_items.dart';
import 'package:onedaytrip/features/shop/screens/checkout/checkout.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';

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

  @override
  Widget build(BuildContext context) {
    final int? userId = UserManager().id;  // Ensure userId is non-null and convert it to int

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItem(), // Pass the user ID here
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder<Map<String, dynamic>>(
          future: TCartItem().fetchCartItem(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink(); // Hoặc hiển thị một CircularProgressIndicator
            }

            final totalPrice = snapshot.data!['totalPrice'];


            return ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              child: Text('Checkout \$${totalPrice.toStringAsFixed(2)}'),
            );
          },
        ),
      ),
    );
  }
}