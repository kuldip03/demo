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

  MyItems copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return MyItems(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory MyItems.fromMap(Map<String, dynamic> map) {
    return MyItems(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyItems.fromJson(String source) =>
      MyItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyItems(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant MyItems other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }

// factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       id: map["id"],
//       name: map["name"],
//       desc: map["desc"],
//       price: map["price"],
//       color: map["color"],
//       image: map["image"],
//     );
//   }

//   toMap() => {
//         "id": id,
//         "name": name,
//         "desc": desc,
//         "price": price,
//         "color": color,
//         "image": image,
//       };
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
