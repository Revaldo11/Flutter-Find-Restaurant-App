import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../model/resto_model.dart';

class RestoApi {
  // Online json api link
  static const url =
      'https://restaurant-app-d0e62-default-rtdb.firebaseio.com/.json';
  static Future<List<RestoModel>> getResto() async {
    final response = await http.get(Uri.parse(url));
    final list = json.decode(response.body);
    return List<RestoModel>.from(list.map((e) => RestoModel.fromJson(e)));
  }

  // Local JSON
  static Future<List<RestoModel>> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/local_resto.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => RestoModel.fromJson(e)).toList();
  }
}
