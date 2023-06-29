import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:match_mingle/AuthUserVisiblePages/chats.dart';
import 'package:match_mingle/AuthUserVisiblePages/home_auth.dart';
import 'package:match_mingle/AuthUserVisiblePages/likes.dart';
import 'package:match_mingle/AuthUserVisiblePages/profile.dart';

class NavigationScreen extends StatefulWidget {
  static String id = "NavigationScreen";

  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AuthUserHome(),
    const LikesScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void _activePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.0,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: GNav(
              gap: 8,
              // the tab button gap between icon and text
              color: Colors.pink,
              // unselected icon color
              activeColor: Colors.white,
              // selected icon and text color
              iconSize: 24,
              // tab button icon size
              tabBackgroundColor: Colors.pink,
              // selected tab background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              // navigation bar padding
              selectedIndex: _selectedIndex,
              onTabChange: _activePage,
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.heart_broken,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Chats',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ],
            ),
          ),
        ));
  }
}
