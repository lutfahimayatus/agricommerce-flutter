import 'package:e_commerce_flutter/src/domain/bottom_navy_bar_item.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData._();

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
      "Beranda",
      const Icon(Icons.home),
      const Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Keranjang",
      const Icon(Icons.shopping_cart),
      const Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Pesanan",
      const Icon(Icons.shopping_cart),
      const Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Profil",
      const Icon(Icons.person),
      const Color.fromARGB(255, 125, 186, 49),
      Colors.grey,
    ),
  ];
}
