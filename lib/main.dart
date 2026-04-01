import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_portfolio/constants/app_colors.dart';
import 'package:latest_portfolio/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeeshan Sheikhs - Flutter Developer',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
        ),
        useMaterial3: true,
        splashFactory: InkRipple.splashFactory,
      ),
      home: const HomeScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//    @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(1440, 1024), 
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Zeeshan Sheikhs',
//          scrollBehavior: MyCustomScrollBehavior(),
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(
//               seedColor: Colors.deepPurple,
//             ),
//           ),
//           home: child,
//         );
//       },
//       child:  HomeView(), 
//     );
//   }
// }
// class MyCustomScrollBehavior extends MaterialScrollBehavior {
 
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse,
//         PointerDeviceKind.stylus,
//         PointerDeviceKind.unknown,
//       };
// }
