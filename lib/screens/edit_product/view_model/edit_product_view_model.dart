// ignore: dangling_library_doc_comments
import 'package:item_manager/model/product.dart';

class EditProductViewModel {
  EditProductViewModel();

  late Product previewData;

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

  void updateData() {
    // Tìm vị trí phần tử trong danh sách
    int index = listProduct.map((p) => p.id).toList().indexOf(previewData.id);
    listProduct[index] = previewData;
  }
}
