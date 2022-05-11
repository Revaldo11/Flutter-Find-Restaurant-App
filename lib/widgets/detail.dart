import 'package:flutter/material.dart';
import 'package:restaurant_apps/model/resto_model.dart';

class DetailResto extends StatelessWidget {
  const DetailResto({Key? key, required this.resto}) : super(key: key);

  final RestoModel resto;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('data'),
    );
  }
}
