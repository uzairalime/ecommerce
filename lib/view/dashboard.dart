import 'package:coolicons/coolicons.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:ecommerce/utilities/text/greytextstyle.dart';
import 'package:ecommerce/view/account_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/wishlist_screen.dart';
import 'package:ecommerce/view/history_screen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool selected = true;
  final pages = [
    HomeScreen(),
    WishlistScreen(),
    HistoryScreen(),
    AccountScreen()
  ];

  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: BottomNavigationBar(
          // List of bottom navigation bar items
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? Icon(Icons.home_filled)
                  : Icon(Icons.abc),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? Icon(Coolicons.search)
                    : Icon(Coolicons.search),
                label: "Whislist"),
            BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? Icon(Icons.edit_document)
                    : Icon(Icons.edit_document),
                label: "History"),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? Icon(Coolicons.user)
                    : Icon(Coolicons.user_check),
                label: "Account"),
          ],
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: _onItemTapped,
          selectedItemColor: AppColor().primary,
          unselectedItemColor: AppColor().secondaryGrey,
          selectedLabelStyle: greyTextStyle(12),
          unselectedLabelStyle: greyTextStyle(12),
          iconSize: 30,
        ),
      ),
    );
  }
}
