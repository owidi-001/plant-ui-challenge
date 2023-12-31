import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planty/presentation/pages/home/home.dart';
import 'package:planty/presentation/pages/profile/profile.dart';
import 'package:planty/utils/theme.dart';

import 'cart/cart.dart';
import 'messages/messages.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomePage(),
        const Messages(),
        const Cart(),
        const Profile()
      ][_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: StaticColors.black),
        child: NavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedIndex: _currentIndex,
            onDestinationSelected: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            indicatorColor: Theme.of(context).primaryColor,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: Colors.white,
                  ),
                  icon: Icon(CupertinoIcons.chat_bubble_text,
                      color: Colors.white),
                  label: 'Messages'),
              NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.bag_fill,
                    color: Colors.white,
                  ),
                  icon: Icon(CupertinoIcons.bag, color: Colors.white),
                  label: 'Cart'),
              NavigationDestination(
                  icon: Icon(CupertinoIcons.person, color: Colors.white),
                  selectedIcon: Icon(
                    CupertinoIcons.person_fill,
                    color: Colors.white,
                  ),
                  label: 'settings')
            ]),
      ),
    );
  }
}
