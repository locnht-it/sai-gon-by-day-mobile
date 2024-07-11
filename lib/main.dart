import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onedaytrip/api/firebase/firebase_api.dart';
import 'package:onedaytrip/firebase_options.dart';

import 'app.dart';

final navigatorkey = GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication


  runApp(const App());
}

//
//
//
// /// Send notification
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

//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:onedaytrip/features/shop/screens/home/home.dart';
// import 'package:onedaytrip/home_page.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   /// initialize firebase from firebase core plugin
//   await Firebase.initializeApp();
//   runApp(MyApp(homeScreen: const MyHomePage(title: 'Firebase homepage',)));
// }
//
// class MyApp extends StatefulWidget {
//   final Widget? homeScreen;
//   MyApp({this.homeScreen});
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: this.widget.homeScreen,
//     );
//   }
// }