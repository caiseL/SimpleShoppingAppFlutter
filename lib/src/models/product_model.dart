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
  int productsSold;
  String image;

  Product({this.id, this.title, this.price, this.productsSold, this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json["title"],
        price: json["price"] / 1,
        productsSold: json["products_sold"],
        image: json["image"]);
  }
}
