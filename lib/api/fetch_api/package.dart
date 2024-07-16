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
//
// Future<List<PackageManage>> fetchPackages() async {
//   final response = await http.get(
//     Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-sale?page=1&limit=10"),
//     headers: {
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMDk3Mjc0MywiZXhwIjoxNzIxMDU5MTQzfQ.UHTT8j_5jISJ51uulMkXcAtfquWog71ZyilFz53lq-U',
//     },
//   );
//
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     if (data['content'] != null) {
//       return (data['content'] as List)
//           .map((packageJson) => PackageManage.fromJson(packageJson))
//           .toList();
//     } else {
//       throw Exception('Content is null');
//     }
//   } else {
//     throw Exception('Failed to load packages');
//   }
// }



Future<List<PackageManage>> fetchPackages({List<int>? ids}) async {
  final response = await http.get(
    Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-sale?page=1&limit=10"),
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final packages = (data['content'] as List)
        .map((packageJson) => PackageManage.fromJson(packageJson))
        .toList();

    // Nếu có ids được cung cấp, lọc gói theo ids
    if (ids != null && ids.isNotEmpty) {
      return packages.where((package) => ids.contains(package.id)).toList();
    }

    return packages;
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
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
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

Future<List<PackageManage>> fetchRecommendedPackages() async {
  final response = await http.get(
    Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-sale?page=1&limit=10"),
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final packages = (data['content'] as List)
        .map((packageJson) => PackageManage.fromJson(packageJson))
        .toList();

    return packages.where((package) => [5, 6, 7, 8].contains(package.id)).toList();
  } else {
    throw Exception('Failed to load packages');
  }
}



final String baseUrl = 'https://trip-by-day-backend.onrender.com';


Future<List<dynamic>> searchPackages(String packageName) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/v1/package-in-day/find-all-search'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
    },
    body: jsonEncode({'packageName': packageName}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['content'];
  } else {
    throw Exception('Failed to load packages');
  }
}



Future<List<PackageManage>> fetchPackagesByName(String packageName) async {
  // Gọi API để tìm các gói theo tên
  final response = await http.post(
    Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-search'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
    },
    body: jsonEncode({'packageName': packageName}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return (data['content'] as List)
        .map((package) => PackageManage.fromJson(package))
        .toList();
  } else {
    throw Exception('Failed to load packages');
  }
}




//
//
// Future<List<PackageManage>> fetchPackageSort({String sortDirection = 'asc'}) async {
//   final response = await http.post(
//     Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-search'),
//     headers: <String, String>{
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
//     },
//     body: jsonEncode({
//       'sortDirection': sortDirection,
//     }),
//   );
//
//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body);
//     List<PackageManage> packages = (jsonData['content'] as List)
//         .map((item) => PackageManage.fromJson(item))
//         .toList();
//     return packages;
//   } else {
//     throw Exception('Failed to load packages');
//   }
// }

/// -- chỉnh sửa lại
Future<List<PackageManage>> fetchPackageSort(String sortDirection) async {
  final response = await http.post(
    Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/package-in-day/find-all-search'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4',
    },
    body: jsonEncode({
      'sortDirection': sortDirection,
      // Add other filter parameters here if needed
    }),
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    List<PackageManage> packages = (jsonData['content'] as List)
        .map((item) => PackageManage.fromJson(item))
        .toList();
    return packages;
  } else {
    throw Exception('Failed to load packages');
  }
}



Future<List<String>> fetchCities() async {
  final response = await http.get(
    Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/city/find-all-true?page=1&limit=63'),
    headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYW1AZ21haWwuY29tIiwicm9sZXMiOiJDVVNUT01FUiIsImlhdCI6MTcyMTA2MDA1MCwiZXhwIjoxNzIxMTQ2NDUwfQ.pf1w9oMfF289rCeAVEbqBpe26egYObSLmLSm0CefQi4'},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<dynamic> content = data['content'];
    return content.map<String>((city) => city['name']).toList();
  } else {
    throw Exception('Failed to load cities');
  }
}

