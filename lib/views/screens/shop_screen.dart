import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<String> categories = [];
  List<String> menCategories = [];
  List<String> womenCategories = [];

  Future<void> fetchData() async {
    final response =
        await Dio().get('https://dummyjson.com/products/categories');

    try {
      if (response.statusCode == 200) {
        setState(() {
          categories = List<String>.from(response.data);
          womenCategories = categories
              .where((category) => category.toLowerCase().startsWith("women"))
              .toList();
          menCategories = categories
              .where((category) => category.toLowerCase().startsWith("men"))
              .toList();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Categories',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400,
            height: 1.22,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        centerTitle: true,
      ),
      body: ContainedTabBarView(
        tabBarProperties: const TabBarProperties(
            height: 44,
            indicatorColor: Color(0xFFDB3022),
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontWeight: FontWeight.w800)),
        tabs: const [
          Text(
            'Women',
            style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text('Men',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ))
        ],
        views: [
          Column(children: [
            const SizedBox(
              height: 16,
            ),
            const CustomBannerWidget(),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: buildCategoryList(womenCategories)),
          ]),
          Column(children: [
            const SizedBox(
              height: 16,
            ),
            const CustomBannerWidget(),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: buildCategoryList(menCategories)),
          ])
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 100,
      decoration: ShapeDecoration(
        color: const Color(0xFFDB3022),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'SUMMER SALES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Up to 50% off',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

buildCategoryList(List<String> categories) {
  String capitalizeText(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  return ListView.separated(
    itemCount: categories.length,
    separatorBuilder: (context, index) => Divider(
      color: const Color(0xFF9B9B9B).withOpacity(0.25),
    ),
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(
          capitalizeText(categories[index]),
          style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    },
  );
}


// ignore_for_file: avoid_print

