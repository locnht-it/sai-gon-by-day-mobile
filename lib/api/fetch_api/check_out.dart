import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onedaytrip/api/auth/push_notification_service.dart';
import 'package:onedaytrip/api/global_variables/fcm_token_manage.dart';
import 'dart:convert';

import '../global_variables/user_manage.dart';

class Checkout {
  final int id;

  Checkout({required this.id});
  final String? token = UserManager().token;


  // Phương thức lấy danh sách ID từ API đầu tiên
  Future<List<int>> fetchCartIds() async {
    print("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000$id");
    print("999999999999999999999999999999999999999999999999999999999999999999$token");
    final response = await http.post(
      Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/order/find-all-sale-for-user/$id?page=1&limit=10"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print("99999999999999999999999999999999999999999999999999999999999999999$response");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['content'];
      return data.map((item) => item['id'] as int).toList();
    } else {
      throw Exception('Failed to load cart IDs');
    }
  }

  Future<List<int>> fetchCartPaidIds() async {
    print("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000$id");
    print("999999999999999999999999999999999999999999999999999999999999999999$token");
    final response = await http.post(
      Uri.parse("https://trip-by-day-backend.onrender.com/api/v1/order/find-all-confirm-for-user/$id?page=1&limit=10"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print("99999999999999999999999999999999999999999999999999999999999999999$response");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['content'];
      return data.map((item) => item['id'] as int).toList();
    } else {
      throw Exception('Failed to load cart IDs');
    }
  }

  // Phương thức xác nhận đơn hàng
  Future<void> confirmOrder(List<int> ids) async {
    print("888888888888888888888888888888888888888888888888888888888888888$ids");
    final response = await http.post(
      Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/order/confirm-order'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        'userId': id,
        'packageInDayIds': ids,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to confirm order');
    }
  }

  Future<void> paidOrder(List<int> ids, BuildContext context) async {
    print("888888888888888888888888888888888888888888888888888888888888888$ids");
    final response = await http.post(
      Uri.parse('https://trip-by-day-backend.onrender.com/api/v1/order/paid-order'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        'userId': id,
        'packageInDayIds': ids,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to confirm order');
    }else{
      if(response.statusCode == 200){
        String? fcmToken = TokenManager().fcmToken;
        String body = "Paid for order successfully. Thanks !!";
        String title = "Paid Successfully.";
        await PushNotificationService.sendNotificationToSelectedDrived(
            fcmToken,
            context,
            title,
            body
        );
      }
    }
  }
}
