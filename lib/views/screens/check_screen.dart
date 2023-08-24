import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/product_controller.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:flutter_ecommerce_course/views/screens/search_screen.dart';
import 'package:flutter_ecommerce_course/views/widgets/listtile_product_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckScreen extends StatefulWidget {
  List<ProductModel> products;
  String pageTitle;
  CheckScreen({super.key, required this.products, required this.pageTitle});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          widget.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400,
            height: 1.22,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => SearchScreen(takenList: widget.products));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          ProductModel product = widget.products[index];
          return ListTileProductWidget(
              imageUrl: product.thumbnail,
              discountPercentage: product.discountPercentage.toString(),
              rating: product.rating.toString(),
              brand: product.brand,
              description: product.description,
              price: product.price.toString());
        },
      ),
    );
  }
}
