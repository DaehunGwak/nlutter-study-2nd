import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_view.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // NEW
      length: 3,
      child: Scaffold(
        body: const SafeArea(
          child: TabBarView(
            // NEW in DefaultTabController
            children: [
              TutorialView(
                title: 'Watch cool videos!',
                description:
                    'Videos are personalized for you based on what you watch, like, and share',
              ),
              TutorialView(
                title: 'Fllow the rules!',
                description:
                'Videos are personalized for you based on what you watch, like, and share',
              ),
              TutorialView(
                title: 'Enjoy the ride!',
                description:
                'Videos are personalized for you based on what you watch, like, and share',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size48),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector( // NEW!! in DefaultTabController
                  color: Colors.white,
                  selectedColor: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
