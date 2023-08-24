import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/views/screens/bag_screen.dart';
import 'package:flutter_ecommerce_course/views/screens/fav_screen.dart';
import 'package:flutter_ecommerce_course/views/screens/home_screen.dart';
import 'package:flutter_ecommerce_course/views/screens/profile_screen.dart';
import 'package:flutter_ecommerce_course/views/screens/shop_screen.dart';

List<Widget> pages = const [
  HomeScreen(),
  ShopScreen(),
  BagScreen(),
  FavScreen(),
  //ProfileScreen(),
];
