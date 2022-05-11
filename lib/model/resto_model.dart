// import 'dart:ffi';

// class RestoModel {
//   late int id;
//   late String name;
//   late String description;
//   late String pictureId;
//   late String city;
//   late Double rating;
//   // late String menus;
//   // late List<String> foods;
//   RestoModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.pictureId,
//     required this.city,
//     required this.rating,
//     // required this.menus,
//     // required this.foods,
//   });

//   static RestoModel fromJson(json) => RestoModel(
//         id: json['id'],
//         name: json['name'],
//         description: json['description'],
//         pictureId: json['pictureId'],
//         city: json['city'],
//         rating: json['rating'],
//         // menus: json['menus'],
//         // foods: json['foods'],
//       );
// }

class RestoModel {
  //data Type
  late String id;
  late String name;
  late String description;
  late String city;
  late String pictureId;
  late double rating;
  late String menus;

// constructor
  RestoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.pictureId,
    required this.rating,
    required this.menus,
  });

  //method that assign values to respective datatype vairables
  RestoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    pictureId = json['pictureId'];
    rating = json['rating'].toDouble();
    menus = json['menus'].toString();
  }
}
