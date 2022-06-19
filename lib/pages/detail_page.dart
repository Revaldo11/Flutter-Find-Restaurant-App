import 'package:flutter/material.dart';
import 'package:restaurant_apps/model/resto_model.dart';
import 'package:restaurant_apps/theme.dart';
import 'package:restaurant_apps/widgets/menu_tile.dart';
import '../api/resto_api.dart';

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
              'Menu',
              style: primaryTextStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Tapped');
                      },
                      child: const MenuTile(
                          text: "Drinks", image: "assets/foods_bg.jpg"),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Tapped');
                      },
                      child: const MenuTile(
                          text: "Foods", image: "assets/drinks_bg.jpg"),
                    ),
                  ],
                ),
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
          future: RestoApi.getResto(),
          builder: (context, snapshort) {
            if (snapshort.connectionState == ConnectionState.waiting) {
              return Container(
                width: double.infinity,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (snapshort.hasData) {
              return ListView(
                children: [
                  hero(),
                  tittleRestaurant(),
                  description(),
                  recomendation(),
                ],
              );
            } else if (snapshort.hasError) {
              return Center(
                child: Text('Error: ${snapshort.error}'),
              );
            }
            return const Text(
              'Something went wrong!!!',
              style: TextStyle(color: Colors.white),
            );
          }),
    );
  }
}
