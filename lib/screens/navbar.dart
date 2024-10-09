import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> screens;

  const BottomNavBar({super.key, required this.screens});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey.shade600,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue[900], // Use Colors.blue[900] here
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.article_outlined),
            label: 'Blog',
            activeIcon: Icon(
              Icons.article,
              color: Colors.blue[900],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            activeIcon: Icon(
              Icons.shopping_cart,
              color: Colors.blue[900],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}
