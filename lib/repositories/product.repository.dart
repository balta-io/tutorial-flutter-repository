import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:prodcat/models/product.model.dart';

class ProductRepository {
  Client client = Client();

  Future<List<ProductModel>> getProducts() async {
    final response = await client.get("https://api.balta.io/v1/courses");

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var products = new List<ProductModel>();

      for (dynamic item in list) {
        ProductModel product = new ProductModel(title: item["title"]);
        products.add(product);
      }

      return products;
    } else {
      throw Exception('Deu ruim!');
    }
  }
}
