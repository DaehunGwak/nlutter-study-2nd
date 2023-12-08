import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class MainNavigationTab extends StatelessWidget {

  const MainNavigationTab({
    super.key,
    required String text,
    required bool isSelected,
    required IconData iconData,
    IconData? selectedIconData,
    required Function onTap,
    bool isBlackTheme = false,
  })  : _text = text,
        _isSelected = isSelected,
        _iconData = iconData,
        _selectedIconData = selectedIconData ?? iconData,
        _onTab = onTap,
        _isBlackTheme = isBlackTheme;

  final String _text;
  final bool _isSelected;
  final IconData _iconData;
  final IconData _selectedIconData;
  final Function _onTab;
  final bool _isBlackTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTab(),
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _isSelected ? 1 : 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.v14,
                FaIcon(
                  _isSelected ? _selectedIconData : _iconData,
                  color: _isBlackTheme ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  _text,
                  style: TextStyle(
                    color: _isBlackTheme ? Colors.white : Colors.black,
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
