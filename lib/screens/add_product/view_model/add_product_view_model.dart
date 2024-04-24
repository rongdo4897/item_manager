// ignore: dangling_library_doc_comments
import 'package:item_manager/model/product.dart';

class AddProductViewModel {
  AddProductViewModel();

  late Product previewData =
      Product(name: "", description: "", image: "", price: 0.0);

  Future<Product> fetchData() {
    return Future.value(previewData);
  }

  Future<bool> checkAction() {
    bool checkSuccess = previewData.image != "" &&
        previewData.name != "" &&
        previewData.description != "" &&
        previewData.price != 0.0;

    return Future.value(checkSuccess);
  }

  void updateName(String name) {
    previewData.name = name;
  }

  void updateDescription(String description) {
    previewData.description = description;
  }

  void updateImage(String image) {
    previewData.image = image;
  }

  void updatePrice(double price) {
    previewData.price = price;
  }

  void insertData() {
    listProduct.add(previewData);
  }
}
