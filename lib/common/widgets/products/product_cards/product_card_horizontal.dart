import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/features/shop/screens/package_details/package_detail.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import '../../../styles/shadows.dart';

// class TProductCardHorizontal extends StatelessWidget {
//   final String packageName;
//   final String packageDescription;
//   final List<String> galleryUrls;
//
//   const TProductCardHorizontal({
//     super.key,
//     required this.packageName,
//     required this.packageDescription,
//     required this.galleryUrls,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(() => const ProductDetailScreen()),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: TSizes.sm / 4),
//         child: Container(
//           decoration: BoxDecoration(
//             color: TColors.white,
//             borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
//             boxShadow: [TShadowStyle.verticalProductShadow],
//           ),
//           child: ListTile(
//             contentPadding: const EdgeInsets.symmetric(vertical: TSizes.lg / 7, horizontal: TSizes.lg / 2),
//             leading: SizedBox(
//               width: 70,
//               height: 60,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
//                 child: Image.network(
//                   galleryUrls.isNotEmpty ? galleryUrls[0] : 'assets/images/places/australia.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // title: Text(packageName),
//             // subtitle: Row(
//             //   children: [
//             //     const Icon(Iconsax.location, color: TColors.grey),
//             //     const SizedBox(width: 4),
//             //     Expanded(child: Text(packageDescription, overflow: TextOverflow.ellipsis)),
//             //   ],
//             // ),
//
//             title:
//             Text(
//               'Việt Nam Quê Hương',
//               style: TextStyle(
//                 fontFamily: 'Roboto',
//               ),
//             ),
//
//
//               subtitle: Row(
//               children: [
//                 const Icon(Iconsax.location, color: TColors.grey),
//                 const SizedBox(width: 4),
//                 Expanded(
//                   child: Text(
//                     packageDescription,
//                     style: const TextStyle(fontFamily: 'Poppins'),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Icon(Iconsax.star, color: Colors.amber, size: TSizes.iconSm),
//                 SizedBox(width: 4),
//                 Text('4.5'),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class TProductCardHorizontal extends StatelessWidget {
  final int packageId; // Thêm biến packageId
  final String packageName;
  final String packageDescription;
  final List<String> galleryUrls;

  const TProductCardHorizontal({
    super.key,
    required this.packageId, // Thêm required cho packageId
    required this.packageName,
    required this.packageDescription,
    required this.galleryUrls,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(packageId: packageId)), // Truyền packageId
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.sm / 4),
        child: Container(
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            boxShadow: [TShadowStyle.verticalProductShadow],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: TSizes.lg / 7, horizontal: TSizes.lg / 2),
            leading: SizedBox(
              width: 70,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                child: Image.network(
                  galleryUrls.isNotEmpty ? galleryUrls[0] : 'assets/images/places/australia.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              packageName,
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Iconsax.location, color: TColors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    packageDescription,
                    style: const TextStyle(fontFamily: 'Poppins'),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Iconsax.star, color: Colors.amber, size: TSizes.iconSm),
                SizedBox(width: 4),
                Text('4.5'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}