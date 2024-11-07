import 'package:flutter/material.dart';
import 'package:test_project/ui/homescreen/presentation/home_page.dart';
import 'package:test_project/ui/profile/presentation/profile_page.dart';
import 'package:test_project/ui/cart/presentation/cart_page.dart';
import 'package:test_project/ui/categories/presentation/categories_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(bottom: _selectedIndex == 0 ? 5 : 0),
                  child: const Icon(Icons.home_outlined),
                ),
                activeIcon: const Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(bottom: _selectedIndex == 1 ? 5 : 0),
                  child: const Icon(Icons.category_outlined),
                ),
                activeIcon: const Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(bottom: _selectedIndex == 2 ? 5 : 0),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                activeIcon: const Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(bottom: _selectedIndex == 3 ? 5 : 0),
                  child: const Icon(Icons.person_outline),
                ),
                activeIcon: const Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
} 