import 'package:get/get.dart';
import '../models/product_model.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController {
  final Rx<List<ProductModel>> _cartElements = Rx<List<ProductModel>>([]);
  List<ProductModel> get cartElements => _cartElements.value;
  RxDouble totalAmount = 0.0.obs;

  void addToCart({
    required ProductModel model,
  }) {
    ///first if checks whether product added to cart or not
    if (_cartElements.value.any((element) => element.id == model.id)) {
      //_favorites.value.removeWhere((element) => element.id == model.id);
      Get.snackbar('Diqqət!', 'Siz artıq bu məhsulu əlavə etmisiniz!',
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      _cartElements.value.add(model);
      Get.snackbar('Uğurlu!', 'Səbətə əlavə olundu!',
          colorText: Colors.white, backgroundColor: Colors.green);
    }
    update();
  }

  void deleteCartProduct({required ProductModel model}) {
    if (_cartElements.value.any((element) => element.id == model.id)) {
      _cartElements.value.removeWhere((element) => element.id == model.id);
    }
    update();
  }

  void getTotalAmount() {
    //totalAmount.value = 0;
    _cartElements.value.forEach((element) {
      totalAmount.value += element.price;
    });

    update();
  }
}
