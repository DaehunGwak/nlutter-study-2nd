import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main/navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_view.dart';

enum Direction { left, right }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.left;
  Page _page = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // to the right
      _direction = Direction.right;
    }

    if (details.delta.dx < 0) {
      // to the left
      _direction = Direction.left;
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _page = Page.second;
      });
      return;
    }
    if (_direction == Direction.right) {
      setState(() {
        _page = Page.first;
      });
      return;
    }
  }

  void _onEnterAppTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate, // NEW: dragging
      onPanEnd: _onPanEnd, // NEW: end of dragging
      child: Scaffold(
        body: SafeArea(
          child: AnimatedCrossFade(
            crossFadeState: _page == Page.first
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
            firstChild: const TutorialView(
              title: 'Watch cool videos!',
              description:
                  'Videos are personalized for you based on what you watch, like, and share',
            ),
            secondChild: const TutorialView(
              title: 'Follow the rules!',
              description: 'Take care one of another! please~',
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.only(
              left: Sizes.size48,
              right: Sizes.size48,
              bottom: Sizes.size24,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _page == Page.first ? 0 : 1,
              child: CupertinoButton(
                onPressed: _onEnterAppTap,
                color: Theme.of(context).colorScheme.primary,
                child: const Text('Enter the app!'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
