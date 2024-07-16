// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:onedaytrip/api/global_variables/user_manage.dart';
// import 'package:onedaytrip/features/shop/screens/package_details/widget/top_image.dart'; // Ensure this path is correct
// import 'package:onedaytrip/features/shop/screens/package_details/widget/description_section.dart';
// import 'package:onedaytrip/features/shop/screens/package_details/widget/detail_section.dart';
// import 'package:onedaytrip/features/shop/screens/package_details/widget/date_section.dart';
// import 'package:onedaytrip/features/shop/screens/package_details/widget/facilities_section.dart';
// import 'package:onedaytrip/features/shop/screens/package_details/widget/bottom_navigation_bar_section.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../../utils/constants/image_strings.dart';
//
//
//
// // class ProductDetailScreen extends StatelessWidget {
// //   const ProductDetailScreen({Key? key}) : super(key: key);
// //
// //   void _launchURL(BuildContext context, String url) async {
// //     final Uri uri = Uri.parse(url);
// //     if (!await launchUrl(uri)) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Could not launch $url')),
// //       );
// //     }
// //   }
// //
// //   void _showImages(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 const Text(
// //                   'Additional Images',
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 CarouselSlider(
// //                   options: CarouselOptions(height: 400.0),
// //                   items: [
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                   ].map((i) {
// //                     return Builder(
// //                       builder: (BuildContext context) {
// //                         return ConstrainedBox(
// //                           constraints: const BoxConstraints(maxWidth: 1000),
// //                           child: Image.asset(i, fit: BoxFit.cover),
// //                         );
// //                       },
// //                     );
// //                   }).toList(),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             TopImageSection(
// //               onBackPressed: () => Navigator.pop(context),
// //               onLogoutPressed: () {
// //                 // Logout logic here
// //               },
// //               onShowImagesPressed: () => _showImages(context),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   DetailSection(code: '', date: '',),
// //                   SizedBox(height: 16),
// //                   DescriptionSection(),
// //                   SizedBox(height: 16),
// //                   DateSection(),
// //                   SizedBox(height: 16),
// //                   DestinationPointSection(),
// //                   SizedBox(height: 16),
// //                   PaxSection(),
// //                   SizedBox(height: 16),
// //                   FacilitiesSection(),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBarSection(),
// //     );
// //   }
// // }
//
//
// class ProductDetailScreen extends StatelessWidget {
//   final int packageId;
//
//   const ProductDetailScreen({Key? key, required this.packageId}) : super(key: key);
//
//   void _launchURL(BuildContext context, String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch $url')),
//       );
//     }
//   }
//
//   void _showImages(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   'Additional Images',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16),
//                 CarouselSlider(
//                   options: CarouselOptions(height: 400.0),
//                   items: [
//                     TImages.chicago,
//                     TImages.chicago,
//                     TImages.chicago,
//                     TImages.chicago,
//                     TImages.chicago,
//                     TImages.chicago,
//                   ].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return ConstrainedBox(
//                           constraints: const BoxConstraints(maxWidth: 1000),
//                           child: Image.asset(i, fit: BoxFit.cover),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TopImageSection(
//               onBackPressed: () => Navigator.pop(context),
//               onLogoutPressed: () {
//                 // Logic for logging out
//               },
//               onShowImagesPressed: () => _showImages(context),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   DetailSection(packageId: packageId),
//                   const SizedBox(height: 16),
//                   DescriptionSection(packageId: packageId),
//                   const SizedBox(height: 16),
//                   DateSection(packageId: packageId),
//                   const SizedBox(height: 16),
//                   DestinationPointSection(),
//                   const SizedBox(height: 16),
//                   FacilitiesSection(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBarSection(packageId: packageId),
//     );
//   }
// }
//
// //
// // class ProductDetailScreen extends StatelessWidget {
// //   final int packageId;
// //
// //   const ProductDetailScreen({Key? key, required this.packageId}) : super(key: key);
// //
// //   Future<Map<String, dynamic>> fetchPackageDetail() async {
// //     final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/$packageId";
// //     final String token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4";
// //
// //     final response = await http.get(Uri.parse(url), headers: {
// //       'Authorization': token,
// //     });
// //
// //     if (response.statusCode == 200) {
// //       final data = json.decode(response.body)['content'];
// //       return data;
// //     } else {
// //       throw Exception('Failed to load package detail');
// //     }
// //   }
// //
// //   void _launchURL(BuildContext context, String url) async {
// //     final Uri uri = Uri.parse(url);
// //     if (!await launchUrl(uri)) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Could not launch $url')),
// //       );
// //     }
// //   }
// //
// //   void _showImages(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 const Text(
// //                   'Additional Images',
// //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 CarouselSlider(
// //                   options: CarouselOptions(height: 400.0),
// //                   items: [
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                     TImages.chicago,
// //                   ].map((i) {
// //                     return Builder(
// //                       builder: (BuildContext context) {
// //                         return ConstrainedBox(
// //                           constraints: const BoxConstraints(maxWidth: 1000),
// //                           child: Image.asset(i, fit: BoxFit.cover),
// //                         );
// //                       },
// //                     );
// //                   }).toList(),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: FutureBuilder<Map<String, dynamic>>(
// //         future: fetchPackageDetail(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //             return const Center(child: Text('No data found'));
// //           } else {
// //             final packageData = snapshot.data!;
// //             final String code = packageData['code'] ?? 'N/A';
// //             final String date = packageData['date']?.split('T')[0] ?? 'N/A';
// //
// //             return SingleChildScrollView(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   TopImageSection(
// //                     onBackPressed: () => Navigator.pop(context),
// //                     onLogoutPressed: () {
// //                       // Logic đăng xuất ở đây
// //                     },
// //                     onShowImagesPressed: () => _showImages(context),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(16.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         DetailSection(packageId: packageId,),
// //                         const SizedBox(height: 16),
// //                         const DescriptionSection(),
// //                         const SizedBox(height: 16),
// //                         const DateSection(),
// //                         const SizedBox(height: 16),
// //                         const DestinationPointSection(),
// //                         const SizedBox(height: 16),
// //                         const PaxSection(),
// //                         const SizedBox(height: 16),
// //                         const FacilitiesSection(),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }
// //         },
// //       ),
// //       bottomNavigationBar: const BottomNavigationBarSection(),
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onedaytrip/api/global_variables/user_manage.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/bottom_navigation_bar_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/date_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/description_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/destination_point.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/detail_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/facilities_section.dart';
import 'package:onedaytrip/features/shop/screens/package_details/widget/top_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatelessWidget {
  final int packageId;

  const ProductDetailScreen({Key? key, required this.packageId}) : super(key: key);

  void _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void _showImages(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Additional Images',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                    TImages.chicago,
                  ].map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1000),
                          child: Image.asset(image, fit: BoxFit.cover),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopImageSection(
              onBackPressed: () => Navigator.pop(context),
              onLogoutPressed: () {
                // Logic for logging out
              },
              onShowImagesPressed: () => _showImages(context), packageId: packageId,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailSection(packageId: packageId),
                  const SizedBox(height: 16),
                  DescriptionSection(packageId: packageId),
                  const SizedBox(height: 16),
                  DateSection(packageId: packageId),
                  const SizedBox(height: 16),
                  DestinationPointSection(),
                  const SizedBox(height: 16),
                  FacilitiesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarSection(packageId: packageId),
    );
  }
}
