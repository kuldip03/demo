class MyItems {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  MyItems(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

class CatalogModel {
  static final items = [
    MyItems(
        id: 1,
        name: "Kuldip",
        desc: "I am a developer",
        price: 999,
        color: "#fff",
        image:
            "https://pbs.twimg.com/profile_images/1757023270/IMG0771A_400x400.jpg")
  ];
}
