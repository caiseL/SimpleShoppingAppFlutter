class Products {
  List<Product> products;

  Products();
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
        price: json["double"],
        productsSold: json["products_sold"],
        image: json["image"]);
  }
}
