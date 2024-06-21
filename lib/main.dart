import 'package:flutter/material.dart';

import 'app.dart';

void main() {

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication


  runApp(const App());
}



//
// Send notification
// import 'package:flutter/material.dart';
//
// import 'Services/notification_service.dart';
// import 'home_page.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   NotificationService().initNotification();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Notifications',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Local Notifications'),
//     );
//   }
// }
//
