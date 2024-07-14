import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/common/widgets/layouts/grid_layout.dart';
import 'package:onedaytrip/common/widgets/layouts/horizontal_layout.dart';
import 'package:onedaytrip/features/shop/screens/all_products/all_products.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/%20promo_slider.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_categories.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/nearest_location_section.dart';
import 'package:onedaytrip/navigation_menu.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import '../../../../api/fetch_api/package.dart';
import '../../../../api/global_variables/package_manage.dart';
import '../../../../common/widgets/articles/article_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/products/product_cards/product_card_verticle.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THomeAppBar(),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TSearchContainer(text: 'Search'),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Popular Nearby',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const THomeCategories(), // Thay đổi đây để gọi widget THomeCategories
                ],
              ),
            ),

            // Các phần khác của trang chủ
            // Padding(
            //   padding: const EdgeInsets.all(TSizes.defaultSpace),
            //   child: Column(
            //     children: [
            //       const TPromoSlider(banners: [
            //         TImages.chicago,
            //         TImages.lima,
            //         TImages.tokyo,
            //       ]),
            //       const SizedBox(height: TSizes.spaceBtwSections),
            //       TSectionHeading(
            //         title: 'Nearest your location',
            //         onPressed: () => Get.to(() => const AllProducts()),
            //       ),
            //       const SizedBox(height: TSizes.spaceBtwItems),
            //       TGridLayout(
            //         itemCount: 2,
            //         itemBuilder: (_, index) => const TProductCardVertical(),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.chicago,
                    TImages.lima,
                    TImages.tokyo,
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Nearest your location',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  FutureBuilder<List<PackageManage>>(
                    future: fetchPackages(ids: [3, 4]), // Lọc theo ID
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No packages found'));
                      }

                      final nearestPackages = snapshot.data!;

                      return TGridLayout(
                        itemCount: nearestPackages.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          packageName: nearestPackages[index].packageName,
                          packageDescription: nearestPackages[index].packageDescription,
                          price: nearestPackages[index].price.toString(),
                          galleryUrls: nearestPackages[index].galleryUrls,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace / 2,
              ),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Recommended',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  THorizontalLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardHorizontal(),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace / 2,
              ),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Article',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const ArticleCard(
                          imageUrl: AssetImage(TImages.canada),
                          title: 'The essential guide to visiting Canada',
                          author: 'Alexander Wooley',
                          date: '5 June 2024',
                          url: 'https://www.nationalgeographic.com/travel/article/essential-guide-canada',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
