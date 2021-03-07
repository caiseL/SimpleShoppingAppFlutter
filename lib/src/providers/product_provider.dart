import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/src/models/product_model.dart';

class ProductProvider {
  String url = "localhost:3000";
  int _actualPage = 0;
  List<Product> _products = [];

  final _productsStreamController = StreamController<List<Product>>.broadcast();

  Function(List<Product>) get productsSink =>
      _productsStreamController.sink.add;

  Stream<List<Product>> get productsStream => _productsStreamController.stream;

  List<Product> fetchInfo(response) {
    final decodedData = json.decode(response.body);
    final Products products = new Products.fromJsonList(decodedData);

    return products.items;
  }

  Future<List<Product>> getProducts() async {
    _actualPage++;

    var response = await http.get(
      Uri.http(
        url,
        "/products",
        {"_page": "$_actualPage", "_limit": "5"},
      ),
    );

    final resp = fetchInfo(response);
    _products.addAll(resp);
    productsSink(_products);

    return resp;
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

      return fetchInfo(response);
    }

    throw Exception("That's not a valid type of sort");
  }

  void close() {
    _productsStreamController?.close();
  }
}
