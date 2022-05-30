import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/resto_model.dart';

class RestoApi {
  Future<List<RestoModel>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/local_resto.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => RestoModel.fromJson(e)).toList();
  }
}
