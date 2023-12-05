import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/main/navigation/stf_screen.dart';
import 'package:tiktok_clone/features/main/navigation/widgets/navigation_tab.dart';
import 'package:tiktok_clone/features/main/navigation/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  _onTab(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const postVideoButton = PostVideoButton();

    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Center(
              child: Text('inbox'),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Center(
              child: Text('profile'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.h12,
            MainNavigationTab(
              text: 'Home',
              iconData: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTab(0),
            ),
            MainNavigationTab(
              text: 'Discover',
              iconData: FontAwesomeIcons.compass,
              selectedIconData: FontAwesomeIcons.solidCompass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTab(1),
            ),
            Gaps.h24,
            GestureDetector(
              onTap: () {
                _onPostVideoButtonTap();
              },
              child: postVideoButton,
            ),
            Gaps.h24,
            MainNavigationTab(
              text: 'Inbox',
              iconData: FontAwesomeIcons.message,
              selectedIconData: FontAwesomeIcons.solidMessage,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTab(3),
            ),
            MainNavigationTab(
              text: 'Profile',
              iconData: FontAwesomeIcons.user,
              selectedIconData: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTab(4),
            ),
            Gaps.h12,
          ],
        ),
      ),
    );
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record Video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
