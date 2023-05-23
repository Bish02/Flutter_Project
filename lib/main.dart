import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/config/theme.dart';
import 'package:my_app/screens/chat_screen.dart';
import 'package:my_app/screens/onBoarding_screen.dart';
import 'screens/home_screen.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      // home: const HomeScreen(),
      home: const onBoarding(),
      getPages: [
        GetPage(name: '/', page: () => const onBoarding()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/chat', page: () => const chatScreen())
      ],
    );
  }
}
