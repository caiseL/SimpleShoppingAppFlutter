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
  int id;
  String title;
  double price;
  double rating;
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
        rating: json["rating"] / 1,
        image: json["image"],
        description: json["description"],
        available: json["available"]);
  }
}
