// BLOC

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductRepository {
  final String _baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
