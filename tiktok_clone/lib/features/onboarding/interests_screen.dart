import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final interests = [
  'Daily Life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Sport',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Oddly Satisfying',
  'Home & Garden',
];

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your interests'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size36,
            right: Sizes.size36,
            bottom: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v32,
              const Text(
                'Choose your interests',
                style: TextStyle(
                  fontSize: Sizes.size52,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              const Text(
                'Get better video recommendations',
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
              Gaps.v48,
              Wrap(
                // NEW!! //
                runSpacing: 20,
                spacing: 20,
                children: [
                  for (var interest in interests)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size16,
                        horizontal: Sizes.size20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Sizes.size32),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        interest,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size24,
            top: Sizes.size12,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: Row(
            children: [
              Gaps.h20,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Gaps.h10,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Gaps.h20,
            ],
          ),
        ),
      ),
    );
  }
}
