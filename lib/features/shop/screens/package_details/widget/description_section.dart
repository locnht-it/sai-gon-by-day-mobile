// import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class DescriptionSection extends StatefulWidget {
//   final int packageId;
//
//
//   const DescriptionSection({Key? key, required this.packageId}) : super(key: key);
//
//   @override
//   _DescriptionSectionState createState() => _DescriptionSectionState();
// }
//
// class _DescriptionSectionState extends State<DescriptionSection>{
//
//   String description = '';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPackageDetail();
//   }
//
//   Future<void> fetchPackageDetail() async {
//     final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
//     final String token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4";
//
//     final response = await http.get(Uri.parse(url), headers: {
//       'Authorization': token,
//     });
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body)['content'];
//       setState(() {
//         description = data['packageDescription'] ?? 'N/A';
//       });
//     } else {
//       throw Exception('Failed to load package detail');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Description',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         const Text(
//           'Mount Semeru or Mount Meru is a cone volcano in East Java, Indonesia. '
//               'Mount Semeru is the highest mountain on the island of Java, with its peak Mahameru, '
//               '3676 meters above sea level.',
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     );
//   }
//
// }
//
//
// //
// // class DescriptionSection extends StatelessWidget {
// //   final String packageDescription;
// //
// //   const DescriptionSection({
// //     Key? key,
// //     required this.packageDescription,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         const Text(
// //           'Description',
// //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //         ),
// //         const SizedBox(height: 8),
// //         Text(
// //           packageDescription,
// //           style: const TextStyle(fontSize: 16),
// //         ),
// //       ],
// //     );
// //   }
// // }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onedaytrip/api/global_variables/user_manage.dart';

class DescriptionSection extends StatefulWidget {
  final int packageId;

  const DescriptionSection({Key? key, required this.packageId}) : super(key: key);

  @override
  _DescriptionSectionState createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  String description = '';

  @override
  void initState() {
    super.initState();
    fetchPackageDetail();
  }

  Future<void> fetchPackageDetail() async {
    final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
    final String? token = UserManager().token;

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer ${token}',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['content'];
        setState(() {
          description = data['packageDescription'] ?? 'N/A';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Text(
        //   date.isNotEmpty ? date : 'Loading...',
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(fontSize: 16),
        // ),
        Text(
          description.isNotEmpty ? description : 'Loading...',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
