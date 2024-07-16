import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:onedaytrip/common/widgets/products/cart/cart_item.dart';
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

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = UserManager().id.toString();
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
              TCartItem(),
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
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.paymentSuccess,
                title: 'Payment Success!',
                subTitle: 'Your package is ready!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
            ),
            child: Text('Checkout \$256.0')),
      ),
    );
  }
}
