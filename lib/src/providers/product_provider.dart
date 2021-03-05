import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoping_app/src/models/product_model.dart';

Future<dynamic> getProducts() async {
  final response =
      await http.get(Uri.https("0.0.0.0:5000", "api/products/all"));
  print(
      response); // Testea esto y quizás haz un Products para llamar allí al método y que haga un cagadero o yo que sé bro
  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}
