import 'package:flutter/material.dart';
import 'package:item_manager/router/routers.dart';
import 'package:item_manager/screens/add_product/add_product.dart';
import 'package:item_manager/screens/list_product/list_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ListProduct.routeName,
        routes: routes,
      ),
    );
  }
}
