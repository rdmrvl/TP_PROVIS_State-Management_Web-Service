// MENGGUNAKAN PROVIDER

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductListPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store - Provider'),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false)
            .fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Consumer<ProductProvider>(
              builder: (ctx, productProvider, child) => ListView.builder(
                itemCount: productProvider.products.length,
                itemBuilder: (ctx, index) {
                  final product = productProvider.products[index];
                  return ListTile(
                    leading:
                        Image.network(product.imageUrl, width: 50, height: 50),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price.toString()}'),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
