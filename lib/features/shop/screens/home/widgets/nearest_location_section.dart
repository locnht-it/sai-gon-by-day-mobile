// import 'package:flutter/material.dart';
// import 'package:onedaytrip/api/global_variables/package_manage.dart';
//
// import '../../../../../api/fetch_api/package.dart';
// import '../../../../../common/widgets/products/product_cards/product_card_verticle.dart';
//
// class NearestLocationSection extends StatelessWidget {
//   const NearestLocationSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<PackageManage>>(
//       future: fetchNearestPackages(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No packages available'));
//         }
//
//         final packages = snapshot.data!;
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Text('Nearest Your Location', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ),
//             SizedBox(
//               height: 180,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: packages.length,
//                 itemBuilder: (context, index) {
//                   final package = packages[index];
//
//                   return TProductCardVertical(
//                     packageName: package.packageName,
//                     packageDescription: package.packageDescription,
//                     price: package.price,
//                     galleryUrls: package.galleryUrls,
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
