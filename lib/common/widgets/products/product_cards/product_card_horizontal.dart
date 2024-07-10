import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/features/shop/screens/package_details/package_detail.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import '../../../styles/shadows.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.sm / 4),
        child: Container(
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            boxShadow: [TShadowStyle.verticalProductShadow],
          ),
          child:
          // ListTile(
          //   contentPadding: const EdgeInsets.symmetric(
          //       vertical: TSizes.lg / 7, horizontal: TSizes.lg / 2),
          //   leading: ClipRRect(
          //     borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
          //     child: const Image(
          //       image: AssetImage(TImages.australia), // Đường dẫn hình ảnh thật
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   title: const Text('Australia'),
          //   subtitle: const Row(
          //     children: [
          //       Icon(Iconsax.location, color: TColors.grey),
          //       SizedBox(width: 4), // Khoảng cách giữa icon và văn bản
          //       Text('Sydney, Australia'),
          //     ],
          //   ),
          //   trailing: const Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Icon(Iconsax.star, color: Colors.amber, size: TSizes.iconSm),
          //       Text('4.5'),
          //     ],
          //   ),
          // ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: TSizes.lg / 7, horizontal: TSizes.lg / 2),
            leading: SizedBox(
              width: 80, // Adjust width according to your image size or design requirements
              height: 80, // Adjust height if needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                child: const
                Image(
                  // image: AssetImage(TImages.australia),
                  image: AssetImage('assets/images/places/australia.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: const Text('Australia'),
            subtitle: const Row(
              children: [
                Icon(Iconsax.location, color: TColors.grey),
                const SizedBox(width: 4), // Spacing between icon and text
                const Text('Sydney, Australia'),
              ],
            ),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Iconsax.star, color: Colors.amber, size: TSizes.iconSm),
                const Text('4.5'),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
