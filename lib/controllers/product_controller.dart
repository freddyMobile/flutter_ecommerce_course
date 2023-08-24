import 'package:flutter_ecommerce_course/constants/url_constants.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProductController extends GetxController {
  final Rx<List<ProductModel>> _products = Rx<List<ProductModel>>([]);

  Rx<bool> isLoading = false.obs;
  List<ProductModel> get products => _products.value;

  Future<void> fetchAllProducts() async {
    _products.value.clear();
    isLoading.value = true;
    final String url = ApiUrls.baseUrl + ApiUrls.productsUrl;
    Dio dio = Dio();
    try {
      var response = await dio.get(url);

      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> prodList = response.data['products'];

        for (int i = 0; i < prodList.length; i++) {
          _products.value.add(ProductModel.fromJson(prodList[i]));
        }
      }
      isLoading.value = false;
    } catch (error, s) {
      print(error.toString());
      print(s);
    }
  }
}
