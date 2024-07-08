import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (_, __) =>
        const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) =>
        const Column(
          children: [
            TCartItem(),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add Remove Buttons
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// -- Product total price
                TProductPriceText(price: '256')
              ],
            )
          ],
        ));
  }
}