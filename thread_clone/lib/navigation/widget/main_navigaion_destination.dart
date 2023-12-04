import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';

class MainNavigationDestination extends StatelessWidget {
  final IconData iconData;
  final IconData? selectedIconData;

  const MainNavigationDestination({
    super.key,
    required this.iconData,
    this.selectedIconData,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: FaIcon(
        iconData,
        color: Colors.grey,
        size: Sizes.size28,
      ),
      selectedIcon: FaIcon(
        selectedIconData ?? iconData,
        size: Sizes.size28,
      ),
      label: 'dummy', // NOTE: if you need label field, please fix it
    );
  }
}
