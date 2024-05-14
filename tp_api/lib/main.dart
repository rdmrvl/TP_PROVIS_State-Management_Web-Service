// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import './bloc/product/product_bloc.dart';
import './repositories/product_repository.dart';
import './providers/product_provider.dart';
import './pages/product_list_page_provider.dart';
import './pages/product_list_page_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(productRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Fake Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TP4 Fakestore API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductListPageProvider()),
                );
              },
              child: Text('Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductListPageBloc()),
                );
              },
              child: Text('Bloc'),
            ),
          ],
        ),
      ),
    );
  }
}
