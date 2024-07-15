
import 'dart:convert';

import 'package:googleapis/connectors/v1.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class PushNotificationService{

  static Future<String> getAccessToken() async{

    final serviceAcountJson = {
        "type": "service_account",
        "project_id": "pushnoti-1e6ed",
        "private_key_id": "1a85bd40e331b40b94aefd0049d6bb98a069a635",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAqfT94IF4T2dq\npNsmHmOmU5GW0BvaDV2qI63HR9se3B2hjjENPB1osO7OhAPqGviY3a02kEgUumCC\nNOsgYhFN357z9SjCbLN6j1pcosge5oEeRxKco4gWep/NcZWgzCrFZHmTiq8oT9pT\nVP1wJLPz66sr2mIcdxodvj3groWkcoTZNaNxEFW8TArplJEaJEzyjqWwdYYT1c6Q\ne8riZAkje5SB6lKGgF5KHtXqK5QKP79JQ5rFT+RK0e8KIQagcUmycYWMkg8godgS\nTZFWqkAr4q5iXgkOGbeMimpwe5H1AZWPLOJ+lGNY7okfOiHzJefF5ZgXtD0cugy8\nnJ6iQsJzAgMBAAECggEAKOxQ0hY8WfI/zLqso/mjgAJTM94LdHMPWKLQeDpOlEz7\n7EN4Ls/8jS674tjOvgyxjkLT1nmqHeECu9WCtfOuqkRcDoSd/kI5k0hc0L1w1YNv\nnJ9LGENyFhhA1lIQjsGfOiNf4ZN9JgpkHPw6AvaA1MhTqPJvkY1I2lV87jsTvvyG\n6ZkQ3bD2e3q58w8+13Bu7mr6N4GUH6F9CWxq8JhiDzz3XbTbXFlx8/+sCDl45p6o\nkbmGLhKxYO36GzpRW8LY51EPDoB0GBQgarmMh9xF5jAHc2mbNgQaz3QplfoXM47X\n5ehCtSuqdgHjsXaHcjzfmSNcNJWgqNYFXbXhjX1YwQKBgQD/1fSYrv8RpFno+rPI\nOOkQHDNmXZ4k1J8bykjNHKgayXOoNqKb+f2IM9u37HgG7BVVhlUeUPQou0BH5ZYC\nLL5oFNiKaTbHSD44iBrbctvZKWJyQkpR2zTAoCgofqYAWoiOSh6I0P2k0bCiKUkQ\nvjrTfp+12M1RdZ6Y34X+LPtmwQKBgQDAyZ6oYBHLzf7G7vUNbPkZkVlefGp/prO/\njDv6NrLmDjU5qIE+00Lz2jmp/0FYnL5zR87Pldu6nIliyGaOrhVr/5lvE+GN9QS/\nn8nrNF4uUqfamCB3h6YVJ9uozq/8N7B1BHw/aLX8l4K5PtrAoBlvQRXhEdvDLT3b\nWZNvlFnKMwKBgQCmNgjtUXQhsBdBx+8Ze+/fKZMzREtEPmcIlQlrSNzmWk8r0CMh\nFu9il959xcHNLYBGyjlussWN2OnQTBaDXzJtSG3OrsCKBCN4cuSQAjVXBw4QkYTb\nXYEOTH8KoA2VWTwyxXDFDpJbjGgnUo9Hs29gjHmSmUH7VGEvjLjvA6ZpgQKBgGY7\nRHAjKay6mu1hD//DlsCxLAQH0+3HN7BOrAt+cBXA2QavTYJEQ0/OnB+CpWNZE0FM\nheXcoP1vPwdsH75voBp6GyIlF8nQcWkwUcHxLjRATpSDcUwRWcgEL95vZDFKUr9q\n1nxFiaPdsEuNgjD9dR9jEzgb4T65wgCMmrtjns2zAoGAL1M4GctJcQ8UABFLULWr\ntPxPvjZ2AMxdQsGGcZdRQPBM8c3BuZCQQaXmR7r28EwXiLQRI/nnu+66EJcoHZ8m\nVXc1d2PFtfqesWyFK+NICwMiMJbCtMQ4eX/UVKuYLcmEVsHlLVDaCGSHJXdGxupj\n0a/zuqdwspGPme6+oFfZnYw=\n-----END PRIVATE KEY-----\n",
        "client_email": "trip-by-day@pushnoti-1e6ed.iam.gserviceaccount.com",
        "client_id": "113576567542941132014",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/trip-by-day%40pushnoti-1e6ed.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
    };

    List<String> scopes =
        [
          //"https://www.googleapis.com/auth/userinfo.email",
          //"https://www.googleapis.com/auth/firebase.database",
          "https://www.googleapis.com/auth/firebase.messaging"
        ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAcountJson),
      scopes,
    );

    //get the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAcountJson),
      scopes,
        client
    );

    client.close();

    return credentials.accessToken.data;

  }
  static sendNotificationToSelectedDrived(String deviceToken, BuildContext context) async{

    final String serverAccessTokenKey = await getAccessToken();
    if (serverAccessTokenKey == null) {
      print('Failed to get access token.');
      return;
    }else{
      print('0000000000000000000000000000000000000000000000000000000000000000000$serverAccessTokenKey');
      print('99999999999999999999999999999999999999999999999999999999$deviceToken');
    }
    String endpointFirebaseCloudMessaging = 'https://fcm.googleapis.com/v1/projects/pushnoti-1e6ed/messages:send';

    final Map<String, dynamic> message =
    // {
    //   'message' :
    //       {
    //         'token' : deviceToken,
    //         'notification' :
    //         {
    //           'title' : "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
    //           'body' : 'tgshhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
    //         }
    //       }
    // };
    {
      "message":{
        "token": deviceToken,
        "notification":{
          "body":"This is an FCM notification message!",
          "title":"FCM Message"
        }
      }
    };

    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String,String>
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey'
      },
      body: jsonEncode(message),
    );

    if(response.statusCode == 200){
      print("Notification send Successfully");
    } else
    {
      print("Failed Notification not send111111111111111111111111111111111111111111111: ${response.statusCode}");
    }

  }



}