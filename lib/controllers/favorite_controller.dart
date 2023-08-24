import 'package:get/get.dart';
import '../models/product_model.dart';

class FavoriteController extends GetxController {
  final Rx<List<ProductModel>> _favorites = Rx<List<ProductModel>>([]);
  List<ProductModel> get favorites => _favorites.value;

  void toggleFavorite({
    required ProductModel model,
  }) {
    //first if checks whether product added to cart or not
    if (_favorites.value.any((element) => element.id == model.id)) {
      _favorites.value.removeWhere((element) => element.id == model.id);
    } else {
      _favorites.value.add(model);
    }
    update();
  }

  bool isFavorite({required ProductModel model}) {
    if (_favorites.value.any((element) => element.id == model.id)) {
      return true;
    } else {
      return false;
    }
  }
}
