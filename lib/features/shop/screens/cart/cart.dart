import 'package:flutter/material.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/images/t_rounded_image.dart';
import 'package:onedaytrip/common/widgets/texts/product_title_text.dart';
import 'package:onedaytrip/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: TSizes.spaceBtwSections),
              itemBuilder: (_, index) => Column(
                    children: [
                      Row(
                        children: [
                      /// Image
                      TRoundedImage(
                        imageUrl: TImages.canada,
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(TSizes.sm),
                        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),

                      /// Title, Price, & Size
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TBrandTitleTextWithVerifiedIcon(title: 'Travel'),
                            const Flexible(child: TProductTitleText(title: 'Canada Trip By Day', maxLines: 1)),
                            /// Attributes
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Person:', style: Theme.of(context).textTheme.bodySmall),
                                  TextSpan(text: '5', style: Theme.of(context).textTheme.bodyLarge),
                                ]
                              )
                            )
                          ],
                        ),
                      ),
  ],
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}
