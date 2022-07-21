// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyItems {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  MyItems({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory MyItems.fromMap(Map<String, dynamic> map) {
    return MyItems(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatalogueModel {
  static List<MyItems>? items;
  // static final items = [
  //   MyItems(
  //       id: 1,
  //       name: "Kuldip",
  //       desc: "I am a developer",
  //       price: 999,
  //       color: "#fff",
  //       image:
  //           "https://pbs.twimg.com/profile_images/1757023270/IMG0771A_400x400.jpg")
  // ];
}
