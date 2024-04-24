import 'package:flutter/material.dart';
import 'package:item_manager/components/build_appBar.dart';
import 'package:item_manager/screens/add_product/components/body.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  static String routeName = "/add_product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "Add Product",
      ),
      body: const Center(
        child: Body(),
      ),
    );
  }
}
