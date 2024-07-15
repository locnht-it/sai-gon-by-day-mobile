

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/api/global_variables/package_manage.dart';
import 'package:onedaytrip/features/shop/screens/package_details/package_detail.dart';

import '../../../../../api/fetch_api/package.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'home_category_items.dart';

// class THomeCategories extends StatelessWidget {
//   const THomeCategories({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(() => const ProductDetailScreen()),
//       child: SizedBox(
//         height: 207,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: const [
//             THomeCategoryItem(
//               image: TImages.semeruMountain,
//               title: 'Semeru Mountain',
//               location: 'East Java, Indonesia',
//               rating: 4.8,
//             ),
//             SizedBox(width: 16), // Spacer between items
//             THomeCategoryItem(
//               image: TImages.rajaAmpat,
//               title: 'Raja Ampat',
//               location: 'West Papua, Indonesia',
//               rating: 4.9,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PackageManage>>(
      future: fetchPackages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No packages found'));
        }

        final packages = snapshot.data!;

        return SizedBox(
          height: 207,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: packages.length > 2 ? 2 : packages.length,
            itemBuilder: (context, index) {
              final package = packages[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () => Get.to(() => const ProductDetailScreen()),
                  // child: THomeCategoryItem(
                  //   image: package.galleryUrls.isNotEmpty
                  //       ? package.galleryUrls[0]
                  //       : TImages.semeruMountain, // Sử dụng một ảnh mặc định nếu không có ảnh
                  //   title: package.packageName,
                  //   location: package.packageDescription,
                  //   rating: 4.8, // Nếu cần, bạn có thể thay đổi logic để lấy rating thực tế
                  // ),
                  child: THomeCategoryItem(
                    image: package.galleryUrls.isNotEmpty
                        ? package.galleryUrls[0] // Giữ nguyên URL hình ảnh
                        : TImages.semeruMountain, // Sử dụng một ảnh mặc định nếu không có ảnh
                    title: package.packageName,
                    location: package.packageDescription,
                    rating: 4.8, // Có thể thay đổi logic để lấy rating thực tế
                  ),

                ),
              );
            },
          ),
        );
      },
    );
  }
}