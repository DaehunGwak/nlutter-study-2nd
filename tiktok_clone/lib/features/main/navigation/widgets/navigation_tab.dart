import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class MainNavigationTab extends StatelessWidget {
  final String _text;
  final bool _isSelected;
  final IconData _iconData;
  final IconData _selectedIconData;
  final Function _onTab;

  const MainNavigationTab({
    super.key,
    required String text,
    required bool isSelected,
    required IconData iconData,
    IconData? selectedIconData,
    required Function onTap,
  })  : _text = text,
        _isSelected = isSelected,
        _iconData = iconData,
        _selectedIconData = selectedIconData ?? iconData,
        _onTab = onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTab(),
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _isSelected ? 1 : 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.v14,
                FaIcon(
                  _isSelected ? _selectedIconData : _iconData,
                  color: Colors.white,
                ),
                Gaps.v5,
                Text(
                  _text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
