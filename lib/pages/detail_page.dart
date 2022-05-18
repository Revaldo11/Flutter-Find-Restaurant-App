import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_apps/model/resto_model.dart';
import 'package:restaurant_apps/theme.dart';
import 'package:restaurant_apps/widgets/recomendation_tile.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.resto}) : super(key: key);

  final RestoModel resto;

  @override
  Widget build(BuildContext context) {
    Widget hero() {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.network(
              resto.pictureId,
              width: double.infinity,
            ),
          ),
        ],
      );
    }

    Widget tittleRestaurant() {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resto.name,
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    resto.city,
                    style: secondaryTextStyale.copyWith(fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              resto.description,
              style: secondaryTextStyale.copyWith(
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }

    Widget recomendation() {
      return Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recomendation',
              style: primaryTextStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecomendationTile(
                    resto: resto,
                  ),
                  RecomendationTile(
                    resto: resto,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        title: Text(resto.name),
      ),
      backgroundColor: backgroundColor1,
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    hero(),
                    tittleRestaurant(),
                    description(),
                    recomendation(),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List<RestoModel>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/local_resto.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => RestoModel.fromJson(e)).toList();
  }

  items(List<RestoModel> resto) {}
}
