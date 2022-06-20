import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/resto_model.dart';

class RestoApi {
  // API URL

  static Future<List<RestoModel>> getResto(String query) async {
    final url = Uri.parse(
        'https://revaldo-356ae-default-rtdb.asia-southeast1.firebasedatabase.app/.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List restos = json.decode(response.body);

      return restos.map((json) => RestoModel.fromJson(json)).where((resto) {
        final titleLower = resto.name.toLowerCase();
        final authorLower = resto.city.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // static final url = Uri.parse(
  //     'https://revaldo-356ae-default-rtdb.asia-southeast1.firebasedatabase.app/.json');
  // static Future<List<RestoModel>> getResto() async {
  //   final response = await http.get(url);
  //   final list = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     if (list != null) {
  //       return list
  //           .map<RestoModel>((json) => RestoModel.fromJson(json))
  //           .toList();
  //     } else {
  //       return [];
  //     }
  //   } else {
  //     throw Exception('Failed to load resto');
  //   }
  // }

  // static Future<List<RestoModel>> searchResto(String query) async {
  //   final response = await http.get(url);
  //   final list = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     return List<RestoModel>.from(
  //       list.map((e) => RestoModel.fromJson(e)).where((resto) {
  //         final nameLower = resto.name.toLowerCase();
  //         final serachLower = query.toLowerCase();
  //         return nameLower.contains(serachLower);
  //       }).tolist(),
  //     );
  //   } else {
  //     throw Exception('Failed to load resto');
  //   }
  // }

  // Local JSON
  // static Future<List<RestoModel>> readJsonData() async {
  //   final jsondata = await rootBundle.loadString('assets/local_resto.json');
  //   final list = json.decode(jsondata) as List<dynamic>;
  //   return list.map((e) => RestoModel.fromJson(e)).toList();
  // }
}
