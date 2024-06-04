import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedaytrip/utils/theme/theme.dart';

import 'features/authentication/screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'navigation_menu.dart';
//
// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'OneDayTrip',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const NavigationMenu(),  // Đây là màn hình chính
//     );
//   }
// }
