import "package:flutter/material.dart";
import "package:foodpicker/landingPage.dart";
import "package:foodpicker/profilePage.dart";
import "package:foodpicker/rewardPage.dart";
import "package:foodpicker/socialPage.dart";
import "package:foodpicker/swipePage.dart";

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 2; // Start with Swipe in the middle

  static final List<Widget> _page = [
    const LandingPage(),
    FeedListPage(),
    FoodScreen(),
    const RewardsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("$index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _page[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Social',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.swipe), label: 'Swipe'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            label: 'Reward',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
