// PROVIDER

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      final List<dynamic> responseData = json.decode(response.body);

      _products = responseData.map((data) => Product.fromJson(data)).toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
