import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/product_controller.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:flutter_ecommerce_course/views/widgets/listtile_product_widget.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  List<ProductModel> takenList = [];
  SearchScreen({super.key, required this.takenList});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchedList = [];
  //ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        leadingWidth: size.width * 0.18,
        toolbarHeight: size.height * 0.1,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: Container(
          height: size.height * 0.04,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              Container(
                width: size.width * 0.65,
                alignment: Alignment.center,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchedList = widget.takenList
                          .where((element) => element.description
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  textAlignVertical: TextAlignVertical.center,
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(bottom: size.height * 0.015),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => ListTileProductWidget(
              imageUrl: searchedList[index].thumbnail,
              discountPercentage:
                  searchedList[index].discountPercentage.toString(),
              rating: searchedList[index].rating.toString(),
              brand: searchedList[index].brand,
              description: searchedList[index].description,
              price: searchedList[index].price.toString()),
          itemCount: searchedList.length),
    );
  }
}
