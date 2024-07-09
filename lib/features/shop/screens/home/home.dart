import 'package:flutter/material.dart';
import 'package:onedaytrip/common/widgets/layouts/grid_layout.dart';
import 'package:onedaytrip/common/widgets/layouts/horizontal_layout.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/%20promo_slider.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_categories.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
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

                  THorizontalLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) =>
                      const TProductCardHorizontal()),
                ],
              ),
            ),

            /// Article Section
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
                    height: 250, // Chiều cao của bài viết
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2, // Số lượng bài viết
                      itemBuilder: (context, index) {
                        return const ArticleCard(
                          imageUrl: AssetImage(TImages.canada), // Sử dụng AssetImage cho ảnh của bạn
                          title: 'The essential guide to visiting Canada',
                          author: 'Alexander Wooley',
                          date: '5 June 2024',
                          url: 'https://www.nationalgeographic.com/travel/article/essential-guide-canada', // Thay bằng link bài báo của bạn
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