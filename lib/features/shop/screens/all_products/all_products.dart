// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
// import 'package:onedaytrip/common/widgets/layouts/grid_layout.dart';
// import 'package:onedaytrip/common/widgets/products/product_cards/product_card_verticle.dart';
// import 'package:onedaytrip/utils/constants/sizes.dart';
//
// // class AllProducts extends StatelessWidget {
// //   const AllProducts({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: const TAppBar(title: Text('Popular Packages'), showBackArrow: true),
// //       body: Padding(
// //         padding: const EdgeInsets.all(TSizes.defaultSpace),
// //         child: Column(
// //           children: [
// //             /// Dropdown
// //             DropdownButtonFormField(
// //               decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
// //               onChanged: (value){},
// //               items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
// //               .map((option)  => DropdownMenuItem(value: option, child: Text(option)))
// //               .toList(),
// //             ),
// //             const SizedBox(height: TSizes.spaceBtwSections),
// //             /// Products
// //             TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// class AllProducts extends StatelessWidget {
//   const AllProducts({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TAppBar(title: Text('Popular Packages'), showBackArrow: true),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Dropdown
//               DropdownButtonFormField(
//                 decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
//                 onChanged: (value) {},
//                 items: [
//                   'Name',
//                   'Higher Price',
//                   'Lower Price',
//                   'Sale',
//                   'Newest',
//                   'Popularity'
//                 ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
//               ),
//               const SizedBox(height: TSizes.spaceBtwSections),
//               /// Products
//               TGridLayout(
//                 itemCount: 4,
//                 itemBuilder: (_, index) => const TProductCardVertical(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:onedaytrip/common/widgets/appbar/appbar.dart';
import 'package:onedaytrip/common/widgets/layouts/grid_layout.dart';
import 'package:onedaytrip/common/widgets/products/product_cards/product_card_verticle.dart';
import 'package:onedaytrip/utils/constants/sizes.dart';
import 'package:onedaytrip/api/global_variables/package_manage.dart';

import '../../../../api/fetch_api/package.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Popular Packages'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: [
                  'Name',
                  'Higher Price',
                  'Lower Price',
                  'Sale',
                  'Newest',
                  'Popularity'
                ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Products
              FutureBuilder<List<PackageManage>>(
                future: fetchPackages(), // Gọi hàm fetchPackages
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No packages found'));
                  }

                  final packages = snapshot.data!;

                  return TGridLayout(
                    itemCount: packages.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      packageName: packages[index].packageName,
                      packageDescription: packages[index].packageDescription,
                      price: packages[index].price.toString(),
                      galleryUrls: packages[index].galleryUrls,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
