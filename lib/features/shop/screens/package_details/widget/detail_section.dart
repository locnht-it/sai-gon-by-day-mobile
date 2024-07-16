import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../api/global_variables/user_manage.dart';

// class DetailSection extends StatelessWidget {
//   const DetailSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(
//           top: BorderSide(color: Colors.grey),
//           bottom: BorderSide(color: Colors.grey),
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: Text(
//                   'RATING',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               const Expanded(
//                 child: Text(
//                   'TYPE',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               const Expanded(
//                 child: Text(
//                   'ESTIMATE',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               const Expanded(
//                 child: Text(
//                   'VIA',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               const Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.star, color: Colors.amber, size: 20),
//                     SizedBox(width: 4),
//                     Text('4.5', style: TextStyle(fontSize: 16)),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               const Expanded(
//                 child: Text(
//                   'Open Trip',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               const Expanded(
//                 child: Text(
//                   '3D 2N',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               Container(
//                 height: 30,
//                 width: 1,
//                 color: Colors.grey,
//               ),
//               const Expanded(
//                 child: Text(
//                   'Ranupane',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


class DetailSection extends StatefulWidget {
  final int packageId;

  const DetailSection({Key? key, required this.packageId}) : super(key: key);

  @override
  _DetailSectionState createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection> {
  String code = '';
  String date = '';
  int numberAttendance = 0;

  @override
  void initState() {
    super.initState();
    fetchPackageDetail();
  }

  Future<void> fetchPackageDetail() async {
    final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
    // final String token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4";
    final String? token = UserManager().token;

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${token}',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['content'];
      setState(() {
        code = data['code'] ?? 'N/A';
        numberAttendance = data['numberAttendance'] ?? 0;
        date = data['date'].split('T')[0]; // Chỉ lấy ngày
      });
    } else {
      throw Exception('Failed to load package detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'RATING',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'CODE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'ESTIMATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              const Expanded(
                child: Text(
                  'PERSON',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text('4.5', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: Text(
                  code.isNotEmpty ? code : 'Loading...',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child:
                Text(
                  date.isNotEmpty ? date : 'Loading...',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey,
              ),
               Expanded(
                child:
                Text(
                  numberAttendance > 0 ? '$numberAttendance' : 'Loading...',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// class DetailSection extends StatefulWidget {
//   final int packageId;
//
//   const DetailSection({Key? key, required this.packageId}) : super(key: key);
//
//   @override
//   _DetailSectionState createState() => _DetailSectionState();
// }
//
// class _DetailSectionState extends State<DetailSection> {
//   String code = '';
//   String date = '';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchPackageDetail();
//   }
//
//   Future<void> fetchPackageDetail() async {
//     final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
//     final String token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9zZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4";
//
//     final response = await http.get(Uri.parse(url), headers: {
//       'Authorization': token,
//     });
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body)['content'];
//       setState(() {
//         code = data['code'] ?? 'N/A';
//         date = data['date'].split('T')[0];
//       });
//     } else {
//       throw Exception('Failed to load package detail');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(
//           top: BorderSide(color: Colors.grey),
//           bottom: BorderSide(color: Colors.grey),
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: Text('RATING', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
//               ),
//               Container(height: 30, width: 1, color: Colors.grey),
//               const Expanded(
//                 child: Text('TYPE', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
//               ),
//               Container(height: 30, width: 1, color: Colors.grey),
//               const Expanded(
//                 child: Text('ESTIMATE', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
//               ),
//               Container(height: 30, width: 1, color: Colors.grey),
//               const Expanded(
//                 child: Text('VIA', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               const Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.star, color: Colors.amber, size: 20),
//                     SizedBox(width: 4),
//                     Text('4.5', style: TextStyle(fontSize: 16)),
//                   ],
//                 ),
//               ),
//               Container(height: 30, width: 1, color: Colors.grey),
//               Expanded(
//                 child: Text(code.isNotEmpty ? code : 'Loading...', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
//               ),
//               Container(height: 30, width: 1, color: Colors.grey),
//               Expanded(
//                 child: Text(date.isNotEmpty ? date : 'Loading...', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
//               ),
//               Container(height: 30, width: 1, color: Colors.grey),
//               const Expanded(
//                 child: Text('Ranupane', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
