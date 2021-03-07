class Products {
  List<Product> items = [];

  Products();

  Products.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var e in jsonList) {
      final product = Product.fromJson(e);
      items.add(product);
    }
  }
}

class Product {
  String id;
  String title;
  double price;
  int rating; // It's supposed to be a double
  String image;
  String description;
  int available;

  Product(
      {this.id,
      this.title,
      this.price,
      this.rating,
      this.image,
      this.description,
      this.available});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json["title"],
        price: json["price"] / 1,
        rating: int.parse(json["rating"]),
        image: json["image"],
        description: json["description"],
        available: json["available"]);
  }
}
