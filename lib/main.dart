import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handbook/pages/navigationRoute.dart';
import 'package:handbook/pages/verificationPage.dart';
import 'package:handbook/themes/dark_theme.dart';
import 'package:handbook/themes/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  //TODO: Not Implemented Theme Switching
  //TODO: Not Implemented Logo Change when theme is changed
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const navigationRoute(),
    );
  }
}

