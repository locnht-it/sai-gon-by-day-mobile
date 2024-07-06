import 'package:flutter/material.dart';
import 'package:onedaytrip/common/widgets/layouts/grid_layout.dart';
import 'package:onedaytrip/common/widgets/layouts/horizontal_layout.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/%20promo_slider.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_categories.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/products/product_cards/product_card_verticle.dart';
import '../../../../common/widgets/texts/section_heading.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   void _onSeeAllPressed() {
//     // Handle the "See all" button press
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 /// -- Appbar
//                 const THomeAppBar(),
//                 const SizedBox(height: TSizes.spaceBtwSections),
//
//                 /// -- Searchbar
//                 const TSearchContainer(text: 'Search'),
//                 const SizedBox(height: TSizes.spaceBtwSections),
//
//                 /// -- Categories
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: TSizes.defaultSpace,
//                       vertical: TSizes.defaultSpace),
//                   child: Column(
//                     children: [
//                       /// -- Heading
//                       TSectionHeading(
//                         title: 'Popular Nearby',
//                         showActionButton: true,
//                         textColor: Colors.black,
//                         onPressed: _onSeeAllPressed,
//                       ),
//                       const SizedBox(height: TSizes.spaceBtwItems),
//
//                       /// -- Categories
//                       /// -- Categories List
//                       const THomeCategories(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//              Padding(
//               padding: const EdgeInsets.all(TSizes.defaultSpace),
//               child: Column(
//                 children: [
//                   /// -- Promo Slider
//                   const TPromoSlider(banners: [TImages.chicago, TImages.lima, TImages.tokyo]),
//                   const SizedBox(height: TSizes.spaceBtwSections),
//
//                   /// -- Heading
//                   TSectionHeading(title: 'Nearest your location', onPressed: () {}),
//                   const SizedBox(height: TSizes.spaceBtwItems),
//
//                   /// -- Neareast your location
//                   TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical())
//                 ],
//               ),
//
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const THomeAppBar(),
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSearchContainer(text: 'Search'),
                const SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace,
                      vertical: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Nearby',
                        showActionButton: true,
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const THomeCategories(),
                    ],
                  ),
                ),
              ],
            ),

            /// Slider & Nearest your location
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banners: [
                    TImages.chicago,
                    TImages.lima,
                    TImages.tokyo
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                      title: 'Nearest your location', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                      itemCount: 2,
                      itemBuilder: (_, index) =>
                      const TProductCardVertical()),
                ],
              ),
            ),

            /// Recommended Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace / 2, // Điều chỉnh khoảng cách dọc
              ),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Recommended',
                    showActionButton: true,
                    textColor: Colors.black,
                    onPressed: () {},
                  ),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: 4, // Số lượng item
                  //   itemBuilder: (context, index) {
                  //     return const ProductCardHorizontal(); // Sử dụng ProductCardHorizontal
                  //   },
                  // ),
                  THorizontalLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) =>
                      const TProductCardHorizontal()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}