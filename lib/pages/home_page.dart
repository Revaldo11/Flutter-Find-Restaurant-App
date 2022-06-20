import 'package:flutter/material.dart';

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
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          FutureBuilder(
            future: RestoApi.getResto(),
            builder: (context, snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshort.hasData) {
                var resto = snapshort.data as List<RestoModel>;
                return Expanded(
                  child: _isLoading
                      ? ListView.builder(itemBuilder: (context, index) {
                          return const NewSkeleton();
                        })
                      : ListView.builder(
                          itemCount: resto.length,
                          itemBuilder: (context, index) {
                            return RestoTile(
                              resto: resto[index],
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
}
