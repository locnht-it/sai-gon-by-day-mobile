// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:onedaytrip/features/shop/screens/home/widgets/home_appbar.dart';
// import 'package:onedaytrip/features/shop/screens/home/widgets/home_categories.dart';
// import 'package:onedaytrip/utils/constants/colors.dart';
// import 'package:onedaytrip/utils/constants/image_strings.dart';
// import 'package:onedaytrip/utils/constants/sizes.dart';
// import 'package:onedaytrip/utils/helpers/helper_functions.dart';
// import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
// import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
// import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
// import '../../../../common/widgets/texts/section_heading.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   /// -- Appbar
//                   THomeAppBar(),
//                   SizedBox(height: TSizes.spaceBtwSections),
//
//                   /// -- Searchbar
//                   TSearchContainer(text: 'Search'),
//                   SizedBox(height: TSizes.spaceBtwSections),
//
//                   /// -- Categories
//                   Padding(
//                     padding: EdgeInsets.only(left: TSizes.defaultSpace),
//                     child: Column(
//                       children: [
//                         /// -- Heading
//                         TSectionHeading(
//                             title: 'Popular Nearby',
//                             showActionButton: false,
//                             textColor: Colors.white),
//                         SizedBox(height: TSizes.spaceBtwItems),
//
//                         /// -- Categories
//                         THomeCategories()
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:onedaytrip/features/shop/screens/home/widgets/home_categories.dart';
import 'package:onedaytrip/utils/constants/colors.dart';
import 'package:onedaytrip/utils/constants/image_strings.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _onSeeAllPressed() {
    // Handle the "See all" button press
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                /// -- Appbar
                const THomeAppBar(),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// -- Searchbar
                const TSearchContainer(text: 'Search'),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// -- Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// -- Heading
                      TSectionHeading(
                        title: 'Popular Nearby',
                        showActionButton: true,
                        textColor: Colors.black,
                        onPressed: _onSeeAllPressed,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      /// -- Categories
                      /// -- Categories List
                      const THomeCategories(),
                    ],
                  ),
                ),
              ],
            ),



          ],
        ),


      ),
    );
  }
}
