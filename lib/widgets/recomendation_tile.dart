import 'package:flutter/material.dart';
import 'package:restaurant_apps/model/resto_model.dart';

class RecomendationTile extends StatelessWidget {
  const RecomendationTile({Key? key, required this.resto}) : super(key: key);
  final RestoModel resto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            resto.pictureId,
            height: 130,
          ),
        ),
      ]),
    );
  }
}
