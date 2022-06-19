import 'package:flutter/material.dart';
import 'package:restaurant_apps/theme.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({Key? key, required this.text, required this.image})
      : super(key: key);
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 85,
      margin: const EdgeInsets.only(bottom: 20, right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.center,
            // stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.2),
              Colors.black.withOpacity(.2),
              // Colors.black.withOpacity(.5),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
