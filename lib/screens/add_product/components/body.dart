import 'package:flutter/material.dart';
import 'package:item_manager/components/default_button.dart';
import 'package:item_manager/components/input_from.dart';
import 'package:item_manager/components/product_card.dart';
import 'package:item_manager/configs/size_config.dart';
import 'package:item_manager/model/product.dart';
import 'package:item_manager/screens/add_product/view_model/add_product_view_model.dart';
import 'package:item_manager/screens/list_product/list_product.dart';
import 'package:status_alert/status_alert.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var addProductViewModel = AddProductViewModel();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputFrom(
                  type: "Image URL",
                  onChanged: (value) {
                    setState(() {
                      addProductViewModel.updateImage(value);
                    });
                  },
                ),
                const SizedBox(height: 12),
                InputFrom(
                  type: "Product Name",
                  onChanged: (value) {
                    setState(() {
                      addProductViewModel.updateName(value);
                    });
                  },
                ),
                const SizedBox(height: 12),
                InputFrom(
                  type: "Description",
                  onChanged: (value) {
                    setState(() {
                      addProductViewModel.updateDescription(value);
                    });
                  },
                ),
                const SizedBox(height: 12),
                InputFrom(
                  type: "Price",
                  keyboard: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      addProductViewModel.updatePrice(
                          value.isEmpty ? 0.0 : double.parse(value));
                    });
                  },
                ),
                const SizedBox(height: 25),
                FutureBuilder<Product>(
                  future: addProductViewModel.fetchData(),
                  builder: (_, snapshot) {
                    return ProductCard(
                      product: snapshot.data ??
                          Product(
                            name: "",
                            description: "",
                            image: "",
                            price: 0.0,
                          ),
                    );
                  },
                ),
                const SizedBox(height: 25),
                FutureBuilder<bool>(
                  future: addProductViewModel.checkAction(),
                  builder: (_, snapshot) {
                    return DefaultButton(
                      width: double.infinity,
                      height: 56,
                      radius: 20,
                      backgroundColor: snapshot.data == true
                          ? const Color(0xFFFF7643)
                          : Colors.grey,
                      textColor: Colors.white,
                      textSize: 20,
                      text: "Continue",
                      press: () {
                        if (snapshot.data == true) {
                          StatusAlert.show(
                            context,
                            duration: const Duration(seconds: 2),
                            subtitle: 'Add Success',
                            configuration:
                                const IconConfiguration(icon: Icons.done),
                            maxWidth: 260,
                          );

                          Future.delayed(const Duration(milliseconds: 2000),
                              () {
                            setState(() {
                              addProductViewModel.insertData();
                            });
                            Navigator.pop(context);
                          });
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
