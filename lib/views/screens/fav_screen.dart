import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/favorite_controller.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:flutter_ecommerce_course/views/widgets/favorite_widget.dart';
import 'package:flutter_ecommerce_course/views/widgets/product_widget.dart';
import 'package:get/get.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
            init: favoriteController,
            builder: (context) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 15),
                    child: Row(
                      children: const [
                        Text(
                          'Favorites',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  favoriteController.favorites.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 400),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  'Your cart is empty',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: favoriteController.favorites.length,
                            itemBuilder: (context, index) {
                              ProductModel favElement =
                                  favoriteController.favorites[index];
                              return FavoriteWidget(
                                  favIcon: favoriteController.isFavorite(
                                          model: favElement)
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                  onFavPressed: () => favoriteController
                                      .toggleFavorite(model: favElement),
                                  imageUrl: favElement.thumbnail,
                                  discountPercentage:
                                      favElement.discountPercentage.toString(),
                                  rating: favElement.rating.toString(),
                                  description: favElement.description,
                                  brand: favElement.brand,
                                  price: favElement.price.toString());
                            },
                          ),
                        )
                ],
              );
            }));
  }
}
