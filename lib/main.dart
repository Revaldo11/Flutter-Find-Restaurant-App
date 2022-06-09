import 'package:flutter/material.dart';
import 'package:restaurant_apps/pages/home_page.dart';
import 'package:restaurant_apps/pages/main_page.dart';
import 'package:restaurant_apps/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
