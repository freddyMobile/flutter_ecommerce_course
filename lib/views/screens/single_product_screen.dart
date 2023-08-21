import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/views/widgets/single_product_image.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9).withOpacity(0.99),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'Short dress',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   width: size.width,
            //   height: size.height * 0.45,
            //   color: Colors.red,
            // ),
            SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: const ImageSlideshow(
                  isLoop: true,
                  indicatorColor: Colors.black,
                  children: [
                    SingleProductImage(
                        imageUrl:
                            "https://plus.unsplash.com/premium_photo-1690338235263-68f2c173b5cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"),
                    SingleProductImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=697&q=80"),
                    SingleProductImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"),
                    SingleProductImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80")
                  ]),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DropdownMenu(
                          trailingIcon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          hintText: 'Size',
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
                      DropdownMenu(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'H&M',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 24,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w400,
                              height: 1.20,
                            ),
                          ),
                          const Text(
                            'Short black dress',
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 11,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/star.png'))),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/star.png'))),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/star.png'))),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/star.png'))),
                              SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/star.png'))),
                              Text(
                                '(10)',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9B9B9B)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        '\$19.99',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 24,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                          height: 1.20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.topCenter,
                    child: const Text(
                      'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn'
                      't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  CustomListTile(buttonText: 'Item Details'),
                  CustomListTile(buttonText: 'Shipping info'),
                  CustomListTile(buttonText: 'Support'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: size.width,
        alignment: Alignment.center,
        color: Colors.white,
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
