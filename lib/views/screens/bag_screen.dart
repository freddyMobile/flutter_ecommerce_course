import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_course/controllers/favorite_controller.dart';
import 'package:get/get.dart';

import '../widgets/custom_bag_cart.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  double totalAmount = 0;
  CartController cartController = Get.put(CartController());
  FavoriteController favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    cartController.getTotalAmount();
    return GetBuilder(
        init: cartController,
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Bag',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 34,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  cartController.cartElements.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 350),
                          child: Center(
                            child: Text(
                              'Cart boşdur',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                          itemCount: cartController.cartElements.length,
                          itemBuilder: (context, index) {
                            var cartItem = cartController.cartElements[index];
                            return CustomBagCard(
                                model: cartItem,
                                imageUrl: cartItem.thumbnail,
                                onFavPressed: () => favoriteController
                                    .toggleFavorite(model: cartItem),
                                discountPercentage:
                                    cartItem.discountPercentage.toString(),
                                rating: cartItem.rating.toString(),
                                brand: cartItem.brand,
                                title: cartItem.title,
                                price: cartItem.price.toString(),
                                numberOfProduct: 1);
                          },
                        ) /* ListView(
                      children: [
                        CustomBagCard(brand: ),
                        CustomBagCard(),
                        CustomBagCard(),
                      ],
                    )*/
                          ),
                  if (cartController.cartElements.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total amount:',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${cartController.totalAmount}\$',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                primary: const Color(0xFFDB3022),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'CHECK OUT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                ],
              ),
            ),
          );
        });
  }
}
