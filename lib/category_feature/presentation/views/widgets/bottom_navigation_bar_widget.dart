import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      currentIndex: 0,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp), label: 'cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_card_sharp), label: 'orders'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'profile'),
      ],
    );
  }
}
