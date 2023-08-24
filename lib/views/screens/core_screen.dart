import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_ecommerce_course/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_course/controllers/favorite_controller.dart';
import 'package:get/get.dart';
import '../../constants/page_constants.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({super.key});

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  FavoriteController favoriteController = Get.put(FavoriteController());
  CartController cartController = Get.put(CartController());
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: curIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xFFDB3022),
          selectedLabelStyle:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          unselectedLabelStyle:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          type: BottomNavigationBarType.fixed,
          currentIndex: curIndex,
          onTap: (value) {
            setState(() {
              curIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
                activeIcon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/activated_home.png'))),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/inactive_home.png'))),
                label: 'Home'),
            const BottomNavigationBarItem(
                activeIcon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/activated_cart.png'))),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/inactive_cart.png'))),
                label: 'Shop'),
            BottomNavigationBarItem(
                activeIcon: GetBuilder(
                    init: cartController,
                    builder: (context) {
                      return badge.Badge(
                        showBadge: cartController.cartElements.isNotEmpty,
                        position: badge.BadgePosition.topEnd(),
                        badgeStyle:
                            const badge.BadgeStyle(badgeColor: Colors.teal),
                        badgeContent: Text(
                          cartController.cartElements.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage(
                                    'assets/images/activated_bag.png'))),
                      );
                    }),
                icon: GetBuilder(
                    init: cartController,
                    builder: (context) {
                      return badge.Badge(
                        showBadge: cartController.cartElements.isNotEmpty,
                        position: badge.BadgePosition.topEnd(),
                        badgeStyle:
                            const badge.BadgeStyle(badgeColor: Colors.teal),
                        badgeContent: Text(
                          cartController.cartElements.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage(
                                    'assets/images/inactive_bag.png'))),
                      );
                    }),
                label: 'Bag'),
            BottomNavigationBarItem(
                activeIcon: GetBuilder(
                    init: favoriteController,
                    builder: (context) {
                      return badge.Badge(
                        showBadge: favoriteController.favorites.isNotEmpty,
                        position: badge.BadgePosition.topEnd(),
                        badgeStyle:
                            const badge.BadgeStyle(badgeColor: Colors.teal),
                        badgeContent: Text(
                          favoriteController.favorites.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage(
                                    'assets/images/activated_heart.png'))),
                      );
                    }),
                icon: GetBuilder(
                    init: favoriteController,
                    builder: (context) {
                      return badge.Badge(
                        showBadge: favoriteController.favorites.isNotEmpty,
                        position: badge.BadgePosition.topEnd(),
                        badgeStyle:
                            const badge.BadgeStyle(badgeColor: Colors.teal),
                        badgeContent: Text(
                          favoriteController.favorites.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage(
                                    'assets/images/inactive_heart.png'))),
                      );
                    }),
                label: 'Favorites'),
            /*  BottomNavigationBarItem(
                activeIcon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image:
                            AssetImage('assets/images/activated_person.png'))),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image:
                            AssetImage('assets/images/inactive_person.png'))),
                label: 'Profile'),*/
          ]),
    );
  }
}
