import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/controllers/favorite_controller.dart';
import 'package:flutter_ecommerce_course/models/product_model.dart';
import 'package:flutter_ecommerce_course/views/screens/check_screen.dart';
import 'package:flutter_ecommerce_course/views/screens/loading_screen.dart';
import 'package:flutter_ecommerce_course/views/screens/single_product_screen.dart';
import 'package:flutter_ecommerce_course/views/widgets/product_widget.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = Get.put(ProductController());
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return const LoadingScreen();
        },
      );
      await productController.fetchAllProducts().then((value) {
        Get.back();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.2),
        body: RefreshIndicator(
          displacement: 150,
          onRefresh: () {
            return productController.fetchAllProducts();
          },
          child: productController.isLoading.value
              ? const LoadingScreen()
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.teal,
                      expandedHeight: size.height * 0.6,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.02),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Fashion\nSale',
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => CheckScreen(
                                        pageTitle: 'All Products',
                                        products: productController.products,
                                      )),
                                  child: Container(
                                    height: size.height * 0.03,
                                    width: size.width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xFFDB3022)),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Check',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        background: Image.asset(
                          'assets/images/poster.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    //3
                    SliverList(
                        delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                          items: [
                            Container(
                              width: size.width,
                              height: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://freedesignfile.com/upload/2018/03/Discount-sale-banner-vectors-material-01.jpg'))),
                            ),
                            Container(
                              width: size.width,
                              height: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://en.pimg.jp/090/691/509/1/90691509.jpg'))),
                            ),
                            Container(
                              width: size.width,
                              height: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.vexels.com/content/154169/preview/black-friday-discount-banner-design-6a4b38.png'))),
                            ),
                          ],
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              viewportFraction: 0.9,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1))),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Laptops',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 34,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Super new laptops',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => CheckScreen(
                                        pageTitle: 'All laptops',
                                        products: productController.products
                                            .where((element) =>
                                                element.category == 'laptops')
                                            .toList(),
                                      ));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: GetBuilder(
                            init: favoriteController,
                            builder: (context) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productController.products
                                    .where((element) =>
                                        element.category == "laptops")
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  List<ProductModel> laptops = productController
                                      .products
                                      .where((element) =>
                                          element.category == "laptops")
                                      .toList();
                                  return InkWell(
                                    onTap: () =>
                                        Get.to(() => SingleProductScreen(
                                              model: laptops[index],
                                              rating: laptops[index]
                                                  .rating
                                                  .toString(),
                                              price: laptops[index]
                                                  .price
                                                  .toString(),
                                              title: laptops[index].title,
                                              category: laptops[index].category,
                                              brand: laptops[index].brand,
                                              description:
                                                  laptops[index].description,
                                              imageUrls: laptops[index].images,
                                            )),
                                    child: ProductWidget(
                                        favIcon: favoriteController.isFavorite(
                                                model: laptops[index])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                        onFavPressed: () =>
                                            favoriteController.toggleFavorite(
                                                model: laptops[index]),
                                        imageUrl: laptops[index].thumbnail,
                                        discountPercentage: laptops[index]
                                            .discountPercentage
                                            .toString(),
                                        rating:
                                            laptops[index].rating.toString(),
                                        description: laptops[index].description,
                                        brand: laptops[index].brand,
                                        price: laptops[index].price.toString()),
                                  );
                                  ;
                                },
                              );
                            }),
                      ),
                      BannerCarousel(
                          initialPage: 0,
                          height: 200,
                          animation: true,
                          banners: [
                            BannerModel(
                                boxFit: BoxFit.fill,
                                imagePath:
                                    'https://static.daktilo.com/sites/415/uploads/2021/07/26/trendyol.jpg',
                                id: '1'),
                            BannerModel(
                                boxFit: BoxFit.fill,
                                imagePath:
                                    'https://i.hbrcdn.com/haber/2021/10/29/ekonomi-trendyol-kasim-indirimi-2021-ne-zaman-trendyol-14494418_5139_amp.jpg',
                                id: '2'),
                            BannerModel(
                                boxFit: BoxFit.fill,
                                imagePath:
                                    'https://www.edrawsoft.com/templates/images/horizontal-discount-banner.png',
                                id: '3')
                          ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Smartphones',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 34,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Super new cellphones',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => CheckScreen(
                                      products: productController.products
                                          .where((element) =>
                                              element.category == 'smartphones')
                                          .toList(),
                                      pageTitle: 'All smartphones'));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: GetBuilder(
                            init: favoriteController,
                            builder: (context) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productController.products
                                    .where((element) =>
                                        element.category == "smartphones")
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  List<ProductModel> smartPhones =
                                      productController
                                          .products
                                          .where((element) =>
                                              element.category == "smartphones")
                                          .toList();
                                  return InkWell(
                                    onTap: () => Get.to(() =>
                                        SingleProductScreen(
                                            model: smartPhones[index],
                                            rating: smartPhones[index]
                                                .rating
                                                .toString(),
                                            price: smartPhones[index]
                                                .price
                                                .toString(),
                                            imageUrls:
                                                smartPhones[index].images,
                                            description:
                                                smartPhones[index].description,
                                            brand: smartPhones[index].brand,
                                            category:
                                                smartPhones[index].category,
                                            title: smartPhones[index].title)),
                                    child: ProductWidget(
                                        favIcon: favoriteController.isFavorite(
                                                model: smartPhones[index])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                        onFavPressed: () =>
                                            favoriteController.toggleFavorite(
                                                model: smartPhones[index]),
                                        imageUrl: smartPhones[index].thumbnail,
                                        discountPercentage: smartPhones[index]
                                            .discountPercentage
                                            .toString(),
                                        rating: smartPhones[index]
                                            .rating
                                            .toString(),
                                        description:
                                            smartPhones[index].description,
                                        brand: smartPhones[index].brand,
                                        price: smartPhones[index]
                                            .price
                                            .toString()),
                                  );
                                },
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Fragrances',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 34,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Super odours',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => CheckScreen(
                                      products: productController.products
                                          .where((element) =>
                                              element.category == "fragrances")
                                          .toList(),
                                      pageTitle: 'All Fragrances'));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: GetBuilder(
                            init: favoriteController,
                            builder: (context) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productController.products
                                    .where((element) =>
                                        element.category == "fragrances")
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  List<ProductModel> fragrances =
                                      productController.products
                                          .where((element) =>
                                              element.category == "fragrances")
                                          .toList();
                                  return InkWell(
                                    onTap: () => Get.to(() =>
                                        SingleProductScreen(
                                            model: fragrances[index],
                                            rating: fragrances[index]
                                                .rating
                                                .toString(),
                                            price: fragrances[index]
                                                .price
                                                .toString(),
                                            imageUrls: fragrances[index].images,
                                            description:
                                                fragrances[index].description,
                                            brand: fragrances[index].brand,
                                            category:
                                                fragrances[index].category,
                                            title: fragrances[index].title)),
                                    child: ProductWidget(
                                        favIcon: favoriteController.isFavorite(
                                                model: fragrances[index])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                        onFavPressed: () =>
                                            favoriteController.toggleFavorite(
                                                model: fragrances[index]),
                                        imageUrl: fragrances[index].thumbnail,
                                        discountPercentage: fragrances[index]
                                            .discountPercentage
                                            .toString(),
                                        rating:
                                            fragrances[index].rating.toString(),
                                        description:
                                            fragrances[index].description,
                                        brand: fragrances[index].brand,
                                        price:
                                            fragrances[index].price.toString()),
                                  );
                                },
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Groceries',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 34,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Super cheap groceries',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => CheckScreen(
                                      products: productController.products
                                          .where((element) =>
                                              element.category == 'groceries')
                                          .toList(),
                                      pageTitle: 'All Groceries'));
                                },
                                child: const Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: GetBuilder(
                            init: favoriteController,
                            builder: (context) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productController.products
                                    .where((element) =>
                                        element.category == "groceries")
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  List<ProductModel> groceries =
                                      productController.products
                                          .where((element) =>
                                              element.category == "groceries")
                                          .toList();
                                  return InkWell(
                                    onTap: () => Get.to(() =>
                                        SingleProductScreen(
                                            model: groceries[index],
                                            imageUrls: groceries[index].images,
                                            description:
                                                groceries[index].description,
                                            brand: groceries[index].brand,
                                            category: groceries[index].category,
                                            title: groceries[index].title,
                                            price: groceries[index]
                                                .price
                                                .toString(),
                                            rating: groceries[index]
                                                .rating
                                                .toString())),
                                    child: ProductWidget(
                                        favIcon: favoriteController.isFavorite(
                                                model: groceries[index])
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                        onFavPressed: () =>
                                            favoriteController.toggleFavorite(
                                                model: groceries[index]),
                                        imageUrl: groceries[index].thumbnail,
                                        discountPercentage: groceries[index]
                                            .discountPercentage
                                            .toString(),
                                        rating:
                                            groceries[index].rating.toString(),
                                        description:
                                            groceries[index].description,
                                        brand: groceries[index].brand,
                                        price:
                                            groceries[index].price.toString()),
                                  );
                                },
                              );
                            }),
                      ),
                    ])),
                  ],
                ),
        ),
      );
    });
  }
}
