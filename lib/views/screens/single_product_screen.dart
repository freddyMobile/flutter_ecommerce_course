import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:flutter_ecommerce_course/views/widgets/single_product_image.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class SingleProductScreen extends StatefulWidget {
  final ProductModel model;
  final List<dynamic> imageUrls;
  final String description;
  final String title;
  final String brand;
  final String price;
  final String rating;
  final category;
  const SingleProductScreen({
    super.key,
    required this.imageUrls,
    required this.description,
    required this.brand,
    required this.category,
    required this.title,
    required this.price,
    required this.rating,
    required this.model,
  });

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9).withOpacity(0.99),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: ImageSlideshow(
                  isLoop: true,
                  indicatorColor: Colors.black,
                  children: widget.imageUrls
                      .map((e) => SingleProductImage(imageUrl: e))
                      .toList()),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // DropdownMenu(
                      //     trailingIcon: Icon(
                      //       Icons.keyboard_arrow_down_rounded,
                      //       color: Colors.black,
                      //     ),
                      //     hintText: 'Size',
                      //     inputDecorationTheme: InputDecorationTheme(
                      //       hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide:
                      //               BorderSide(color: Color(0xFFDB3022))),
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //               BorderSide(color: Color(0xFFDB3022))),
                      //     ),
                      //     dropdownMenuEntries: [
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //       DropdownMenuEntry(value: 2, label: 'aa'),
                      //     ]),
                      /* DropdownMenu(
                          trailingIcon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          hintText: 'Color',
                          inputDecorationTheme: InputDecorationTheme(
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFDB3022))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFDB3022))),
                          ),
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                            DropdownMenuEntry(value: 2, label: 'aa'),
                          ]),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),*/
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.brand,
                                  style: const TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 24,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                    height: 1.20,
                                  ),
                                ),
                                Text(
                                  widget.category,
                                  style: const TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'))),
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'))),
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'))),
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'))),
                                    const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/star.png'))),
                                    Text(
                                      '(${widget.rating})',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF9B9B9B)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   width: 200,
                            // ),
                            Text(
                              '${widget.price} \$',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 40, 40),
                                fontSize: 24,
                                fontFamily: 'Metropolis',
                                fontWeight: FontWeight.w400,
                                height: 1.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  InkWell(
                      onTap: () => Get.defaultDialog(
                          title: 'Məlumat',
                          content: Container(
                            height: 100,
                            width: size.width,
                            color: Colors.red,
                          )),
                      child: CustomListTile(buttonText: 'Item Details')),
                  //CustomListTile(buttonText: 'Shipping info'),
                  CustomListTile(buttonText: 'Support'),
                ])),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: size.width,
        alignment: Alignment.center,
        color: Colors.white,
        child: InkWell(
          onTap: () => cartController.addToCart(model: widget.model),
          child: Container(
            height: 50,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFFDB3022)),
            alignment: Alignment.center,
            child: const Text(
              'ADD TO CART',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String buttonText;
  const CustomListTile({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        Container(
          alignment: Alignment.center,
          height: 40,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonText,
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 16,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Icon(
                Icons.arrow_right_sharp,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
