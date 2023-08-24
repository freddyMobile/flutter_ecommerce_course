// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_course/controllers/favorite_controller.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:get/get.dart';

class CustomBagCard extends StatefulWidget {
  final ProductModel model;
  final String imageUrl;
  VoidCallback onFavPressed;
  final String discountPercentage;
  final String rating;
  final String brand;
  final String title;
  final String price;
  int numberOfProduct;

  CustomBagCard({
    Key? key,
    required this.imageUrl,
    required this.onFavPressed,
    required this.discountPercentage,
    required this.rating,
    required this.brand,
    required this.title,
    required this.price,
    this.numberOfProduct = 1,
    required this.model,
  }) : super(key: key);

  @override
  State<CustomBagCard> createState() => _CustomBagCardState();
}

class _CustomBagCardState extends State<CustomBagCard> {
  CartController cartController = Get.find();
  FavoriteController favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 25,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(children: [
          Container(
            height: 80,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(widget.imageUrl))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Brand:',
                                    style: TextStyle(
                                      color: Color(0xFF9B9B9B),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.02,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.brand,
                                    style: const TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${(double.parse(widget.price) - double.parse(widget.price) * 100 / double.parse(widget.discountPercentage)).toStringAsFixed(1)}\$',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 14,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w500,
                                    height: 1.43,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${widget.price}\$',
                                  style: const TextStyle(
                                    color: Color(0xFFDB3022),
                                    fontSize: 14,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w500,
                                    height: 1.43,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    MenuAnchor(
                      style: MenuStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Colors.white; // Use the component's default.
                          },
                        ),
                        padding: MaterialStateProperty.resolveWith(
                          (states) => const EdgeInsets.all(12),
                        ),
                      ),
                      builder: (BuildContext context, MenuController controller,
                          Widget? child) {
                        return SizedBox(
                          width: 30,
                          child: IconButton(
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                            color: Colors.black.withOpacity(0.25),
                            icon: const Icon(Icons.more_vert),
                          ),
                        );
                      },
                      menuChildren: [
                        InkWell(
                          onTap: () => favoriteController.toggleFavorite(
                              model: widget.model),
                          child: const Text(
                            'Add to favorites',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () => cartController.deleteCartProduct(
                              model: widget.model),
                          child: const Text(
                            'Delete from the list',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Container(
                        //   width: 36,
                        //   height: 36,
                        //   decoration: const ShapeDecoration(
                        //     color: Colors.white,
                        //     shape: OvalBorder(),
                        //     shadows: [
                        //       BoxShadow(
                        //         color: Color(0x19000000),
                        //         blurRadius: 8,
                        //         offset: Offset(0, 4),
                        //         spreadRadius: 0,
                        //       )
                        //     ],
                        //   ),
                        //   child: IconButton(
                        //     padding: const EdgeInsets.all(0),
                        //     onPressed: () {
                        //       if (widget.numberOfProduct > 1) {
                        //         widget.numberOfProduct--;
                        //         //
                        //       } else if (widget.numberOfProduct == 1) {
                        //         cartController.deleteCartProduct(
                        //             model: widget.model);

                        //         //cartController.getTotalAmount();
                        //       }
                        //       cartController.getTotalAmount();
                        //       setState(() {});
                        //       // WidgetsBinding.instance.addPostFrameCallback((_) {
                        //       //   // Add Your Code here.
                        //       //   cartController.getTotalAmount();
                        //       // });
                        //     },
                        //     icon: const Icon(
                        //       Icons.remove,
                        //       color: Color(0xFF9B9B9B),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          width: 8,
                        ),
                        // Text(
                        //   widget.numberOfProduct.toString(),
                        //   style: const TextStyle(
                        //     color: Color(0xFF222222),
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              //cartController.getTotalAmount();

                              widget.numberOfProduct++;
                              cartController.getTotalAmount();
                              setState(() {});

                              // WidgetsBinding.instance.addPostFrameCallback((_) {
                              //   // Add Your Code here.
                              //   //cartController.getTotalAmount();
                              // });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFF9B9B9B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.price}\$',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
