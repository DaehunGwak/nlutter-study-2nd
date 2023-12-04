import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/home/home_screen.dart';
import 'package:thread_clone/navigation/widget/main_navigaion_destination.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  static const _screens = [
    HomeScreen(),
    Center(child: Text('dummy search')),
    Center(child: Text('dummy write')),
    Center(child: Text('dummy notification')),
    Center(child: Text('dummy user')),
  ];

  int _currentIndex = 0;

  // TODO: void 를 넣고 안넣고의 차이는?
  _onNavigationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: Sizes.size44,
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: _onNavigationSelected,
          elevation: 0,
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            MainNavigationDestination(iconData: FontAwesomeIcons.house),
            MainNavigationDestination(
                iconData: FontAwesomeIcons.magnifyingGlass),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.squarePlus,
              selectedIconData: FontAwesomeIcons.solidSquarePlus,
            ),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.heart,
              selectedIconData: FontAwesomeIcons.solidHeart,
            ),
            MainNavigationDestination(
              iconData: FontAwesomeIcons.user,
              selectedIconData: FontAwesomeIcons.solidUser,
            ),
          ],
        ),
      ),
    );
  }
}
