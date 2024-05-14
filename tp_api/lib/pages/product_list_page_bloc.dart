// MENGGUNAKAN BLOC

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/product/product_event.dart';
import '../bloc/product/product_state.dart';

class ProductListPageBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store - Bloc'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            context.read<ProductBloc>().add(FetchProducts());
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (ctx, index) {
                final product = state.products[index];
                return ListTile(
                  leading:
                      Image.network(product.imageUrl, width: 50, height: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toString()}'),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
