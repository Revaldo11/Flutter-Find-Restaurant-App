import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_apps/model/resto_model.dart';
import 'package:restaurant_apps/theme.dart';
import 'package:restaurant_apps/widgets/resto_tile.dart';

import '../api/resto_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        title: Container(
          height: 45,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              hintText: "Find your restaurant",
              hintStyle: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant List',
              style: primaryTextStyle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Recomendation for you',
              style: secondaryTextStyale.copyWith(
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      backgroundColor: backgroundColor1,
      //Widget FutureBuilder untuk mengambil data dari json
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          FutureBuilder(
            future: RestoApi().ReadJsonData(),
            builder: (context, snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshort.hasData) {
                var resto = snapshort.data as List<RestoModel>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: resto.length,
                    itemBuilder: (context, index) {
                      return RestoTile(resto: resto[index]);
                    },
                  ),
                );
              } else if (snapshort.hasError) {
                return Center(
                  child: Text('Error: ${snapshort.error}'),
                );
              }
              return const Text(
                'show data',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }
}
