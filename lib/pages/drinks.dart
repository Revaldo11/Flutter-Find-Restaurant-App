import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:restaurant_apps/theme.dart';

import '../widgets/wifi_draw.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DrinkPage(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class DrinkPage extends StatefulWidget {
  const DrinkPage({Key? key}) : super(key: key);

  @override
  _DrinkPageState createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    firstAnimation = Tween<double>(begin: .37, end: .3).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    secondAnimation = Tween<double>(begin: .5, end: .41).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    thirdAnimation = Tween<double>(begin: .63, end: .52).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    fourthAnimation = Tween<double>(begin: .76, end: .63).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Under Construction'),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor1,
      body: Center(
        child: CustomPaint(
          painter: DrawPath(
            firstAnimation.value,
            secondAnimation.value,
            thirdAnimation.value,
            fourthAnimation.value,
          ),
          child: const SizedBox(
            height: 250,
            width: 210,
          ),
        ),
      ),
    );
  }
}
