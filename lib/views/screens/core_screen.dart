import 'package:flutter/material.dart';

import '../../constants/page_constants.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({super.key});

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curIndex],
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
          items: const [
            BottomNavigationBarItem(
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
            BottomNavigationBarItem(
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
                activeIcon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/activated_bag.png'))),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/inactive_bag.png'))),
                label: 'Bag'),
            BottomNavigationBarItem(
                activeIcon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image:
                            AssetImage('assets/images/activated_heart.png'))),
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(
                        image: AssetImage('assets/images/inactive_heart.png'))),
                label: 'Favorites'),
            BottomNavigationBarItem(
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
                label: 'Profile'),
          ]),
    );
  }
}
