import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_apps/model/resto_model.dart';
import 'package:restaurant_apps/theme.dart';
import 'package:restaurant_apps/widgets/resto_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  Future<List<RestoModel>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/local_resto.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => RestoModel.fromJson(e)).toList();
  }

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
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var resto = data.data as List<RestoModel>;
              //ListView untuk menampilkan data dari json
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(),
                      ],
                    );
                  }
                  return RestoTile(resto: resto[index]);
                },
                itemCount: resto.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
