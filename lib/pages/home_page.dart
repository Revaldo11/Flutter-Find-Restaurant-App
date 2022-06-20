import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_apps/widgets/search_widget.dart';
import '../data/api/resto_api.dart';
import '../data/model/resto_model.dart';
import '../theme.dart';
import '../widgets/resto_tile.dart';
import '../widgets/skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RestoModel> restos = [];
  String query = '';
  Timer? debouncer;
  late RestoModel resto;
  // late bool _isLoading;

  @override
  void initState() {
    // _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        // _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final restos = await RestoApi.getResto(query);

    setState(() => this.restos = restos);
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor1,
        title: Container(
          height: 45,
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
          buildSearch(),
          header(),
          FutureBuilder(
            future: RestoApi.getResto(query),
            builder: (context, snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshort.hasData) {
                restos = snapshort.data as List<RestoModel>;
                // var resto = snapshort.data as List<RestoModel>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: restos.length,
                    itemBuilder: (context, index) {
                      final resto = restos[index];
                      return RestoTile(
                        resto: resto,
                      );
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

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Find your restaurant',
        onChanged: searchResto,
      );

  Future searchResto(String query) async => debounce(() async {
        final restos = await RestoApi.getResto(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.restos = restos;
        });
      });
}
