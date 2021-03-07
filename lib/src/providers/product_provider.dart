import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoping_app/src/models/product_model.dart';

class ProductProvider {
  String url = "localhost:3000";
  int _actualPage = 0;

  Future<List<Product>> getProducts() async {
    _actualPage++;

    var response = await http.get(
      Uri.http(
        url,
        "/products",
        {"_page": "$_actualPage", "_limit": "5"},
      ),
    );
    return getInfo(response);
  }

  List<Product> getInfo(response) {
    final decodedData = json.decode(response.body);
    final Products products = new Products.fromJsonList(decodedData);

    return products.items;
  }

  Future<List<Product>> getSort(String sort, String order) async {
    if (sort == "rating" ||
        sort == "id" ||
        sort == "title" ||
        sort == "id" ||
        sort == "available" ||
        order == "desc" ||
        order == "asc") {
      var response = await http.get(
        Uri.http(
          url,
          "/products?_sort=$sort&_order=$order",
          {"_sort": "$sort", "_order": "$order"},
        ),
      );

      return getInfo(response);
    }

    throw Exception("That's not a valid type of sort");
  }
}
