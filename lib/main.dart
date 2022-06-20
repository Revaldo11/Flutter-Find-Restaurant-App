import 'package:flutter/material.dart';
import 'package:restaurant_apps/pages/custom_spalsh.dart';
import 'package:restaurant_apps/pages/drinks.dart';
import 'package:restaurant_apps/pages/foods.dart';
import 'package:restaurant_apps/pages/home_page.dart';
import 'package:restaurant_apps/pages/main_page.dart';
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
        '/': (context) => const MyCustomSpalsh(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomePage(),
        '/drinks-page': (context) => const DrinkPage(),
        '/foods-page': (context) => const FoodsPage()
      },
    );
  }
}
