import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoping_app/src/models/product_model.dart';

class ProductProvider {
  Future<List<Product>> getProducts() async {
    var response = await http.get(Uri.http("localhost:3000", "/products/"));

    final decodedData = json.decode(response.body);
    final Products products = new Products.fromJsonList(decodedData);
    print(products.items);

    return products.items;
  }
}
