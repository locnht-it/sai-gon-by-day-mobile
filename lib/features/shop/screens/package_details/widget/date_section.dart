// import 'package:flutter/material.dart';
//
// class DateSection extends StatelessWidget {
//   const DateSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Time Range',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               ChoiceChip(
//                 label: Text('15 Dec - 20 Dec 2023'),
//                 selected: false,
//                 onSelected: (selected) {},
//                 backgroundColor: Colors.white,
//               ),
//               SizedBox(width: 8),
//               ChoiceChip(
//                 label: Text('25 Dec - 30 Dec 2023'),
//                 selected: false,
//                 onSelected: (selected) {},
//                 backgroundColor: Colors.white,
//               ),
//               SizedBox(width: 8),
//               ChoiceChip(
//                 label: const Row(
//                   children: [
//                     Icon(Icons.calendar_today, size: 16),
//                     SizedBox(width: 4),
//                     Text('Choose Date'),
//                   ],
//                 ),
//                 selected: false,
//                 onSelected: (selected) {},
//                 backgroundColor: Colors.white,
//               ),
//             ],
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
class DateSection extends StatefulWidget {
  final int packageId;

  const DateSection({Key? key, required this.packageId}) : super(key: key);

  @override
  _DateSectionState createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  String packageStartTime = '';
  String packageEndTime = '';

  @override
  void initState() {
    super.initState();
    fetchPackageDetail();
  }

  Future<void> fetchPackageDetail() async {
    final String url = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-id/${widget.packageId}";
    final String? token = UserManager().token;

    try {
      print('Fetching package details from $url');
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['content'];
        setState(() {
          packageStartTime = _formatUnixTimestamp(data['packageStartTime']);
          packageEndTime = _formatUnixTimestamp(data['packageEndTime']);;
        });
        print('Package details fetched successfully');
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to load package detail');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load package detail');
    }
  }

  String _formatUnixTimestamp(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time Range',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ChoiceChip(
                label: Text(packageStartTime.isNotEmpty && packageEndTime.isNotEmpty
                    ? '$packageStartTime - $packageEndTime'
                    : 'Loading...'),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text(
                  'Start Time: $packageStartTime',
                ),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text(
                  'End Time: $packageEndTime',
                ),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 8),
              // ChoiceChip(
              //   label: const Row(
              //     children: [
              //       Icon(Icons.calendar_today, size: 16),
              //       SizedBox(width: 4),
              //       Text('Choose Date'),
              //     ],
              //   ),
              //   selected: false,
              //   onSelected: (selected) {},
              //   backgroundColor: Colors.white,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}