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
  List<dynamic> images;
  String description;
  int available;
  List<dynamic> colors;
  List<dynamic> sizes;

  Product(
      {this.id,
      this.title,
      this.price,
      this.rating,
      this.images,
      this.description,
      this.available,
      this.colors,
      this.sizes});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      images: json["images"],
      title: json["title"],
      price: json["price"] / 1,
      rating: int.parse(json["rating"]),
      description: json["description"],
      available: json["available"],
      colors: json["colors"],
      sizes: json["sizes"],
    );
  }
}
