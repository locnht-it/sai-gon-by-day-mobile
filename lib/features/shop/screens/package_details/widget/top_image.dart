// import 'package:flutter/material.dart';
// import 'package:onedaytrip/utils/constants/image_strings.dart';
//
// class TopImageSection extends StatelessWidget {
//   final VoidCallback onBackPressed;
//   final VoidCallback onLogoutPressed;
//   final VoidCallback onShowImagesPressed;
//
//   const TopImageSection({
//     Key? key,
//     required this.onBackPressed,
//     required this.onLogoutPressed,
//     required this.onShowImagesPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.asset(
//           TImages.canada, // Đường dẫn đến hình ảnh
//           height: 300,
//           width: double.infinity,
//           fit: BoxFit.cover,
//         ),
//         Positioned(
//           top: 40,
//           left: 16,
//           child: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: onBackPressed,
//           ),
//         ),
//         Positioned(
//           top: 40,
//           right: 16,
//           child: IconButton(
//             icon: Icon(Icons.logout, color: Colors.white),
//             onPressed: onLogoutPressed, // Logout here
//           ),
//         ),
//         const Positioned(
//           bottom: 16,
//           left: 16,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Semeru Mountain',
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'Malang, East Java',
//                 style: TextStyle(color: Colors.white70),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 16,
//           right: 16,
//           child: GestureDetector(
//             onTap: onShowImagesPressed,
//             child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.blue.withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.photo_library, color: Colors.white),
//                   SizedBox(width: 8),
//                   Text(
//                     '5+',
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onedaytrip/api/global_variables/user_manage.dart';

import '../../../../../utils/constants/image_strings.dart';

class TopImageSection extends StatefulWidget {
  final int packageId;
  final VoidCallback onBackPressed;
  final VoidCallback onLogoutPressed;
  final VoidCallback onShowImagesPressed;


  const TopImageSection(
      {Key? key,
      required this.packageId,
      required this.onBackPressed,
      required this.onLogoutPressed,
      required this.onShowImagesPressed})
      : super(key: key);

  @override
  _TopImageSectionState createState() => _TopImageSectionState();
}

class _TopImageSectionState extends State<TopImageSection> {
  String packageName = '';
  String packageShortDescription = '';
  List<String> galleryUrls = [];


  @override
  void initState() {
    super.initState();
    fetchPackageDetail();
  }

  Future<void> fetchPackageDetail() async {
    final String url =
        "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
    final String? token = UserManager().token;

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer ${token}',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['content'];
        setState(() {
          packageName = data['packageName'] ?? 'N/A';
          packageShortDescription = data['packageShortDescription'] ?? 'N/A';
          galleryUrls = List<String>.from(data['galleryUrls'] ?? []);
        });
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to load package detail');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load package detail');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          TImages.canada, // Đường dẫn đến hình ảnh
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: widget.onBackPressed, // Use widget to access the callback
          ),
        ),
        Positioned(
          top: 40,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: widget.onLogoutPressed, // Use widget to access the callback
          ),
        ),
     Positioned(
          bottom: 16,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                packageName.isNotEmpty ? packageName : 'Loading...',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                packageShortDescription.isNotEmpty ? packageShortDescription : 'Loading...',

                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: GestureDetector(
            onTap: widget.onShowImagesPressed, // Use widget to access the callback
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.photo_library, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    '5+',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
