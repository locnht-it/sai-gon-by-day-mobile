// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class PackageApiService {
//   final String baseUrl = "https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-sale?page=1&limit=10";
//
//   Future<List<dynamic>> fetchPopularNearby() async {
//     final response = await http.get(Uri.parse(baseUrl));
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return data['content'];
//     } else {
//       throw Exception('Failed to load popular nearby packages');
//     }
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:onedaytrip/api/global_variables/package_manage.dart';

Future<List<PackageManage>> fetchPackages() async {
  final response = await http.get(
    Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-sale?page=1&limit=10"),
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMDk3Mjc0MywiZXhwIjoxNzIxMDU5MTQzfQ.UHTT8j_5jISJ51uulMkXcAtfquWog71ZyilFz53lq-U',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['content'] != null) {
      return (data['content'] as List)
          .map((packageJson) => PackageManage.fromJson(packageJson))
          .toList();
    } else {
      throw Exception('Content is null');
    }
  } else {
    throw Exception('Failed to load packages');
  }
}

// Future<List<PackageManage>> fetchNearestPackages() async {
//   final response = await http.get(Uri.parse('API_ENDPOINT'));
//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body);
//     return (jsonData['content'] as List)
//         .where((pkg) => pkg['id'] == 3 || pkg['id'] == 4)
//         .map((pkg) => PackageManage.fromJson(pkg))
//         .toList();
//   } else {
//     throw Exception('Failed to load packages');
//   }
// }

Future<List<PackageManage>> fetchNearestPackages() async {
  final response = await http.get(
    Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-sale?page=1&limit=10'),
    headers: {
      'Authorization': 'Bearer your_token_here',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['content']
        .where((package) => package['id'] == 3 || package['id'] == 4)
        .map((package) => PackageManage.fromJson(package))
        .toList();
  } else {
    throw Exception('Failed to load packages');
  }
}


