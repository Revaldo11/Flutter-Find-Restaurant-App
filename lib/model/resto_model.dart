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
