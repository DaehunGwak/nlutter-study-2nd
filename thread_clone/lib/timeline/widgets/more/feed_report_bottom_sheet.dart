import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class FeedReportBottomSheet extends StatelessWidget {
  const FeedReportBottomSheet({super.key});

  final reportReasons = const [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "Hate speech or symbol",
    "Nudity or sexual activity",
    "Bullying or harassment",
    "Sale of illegal or regulated goods",
    "Violence or dangerous organizations",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print('report: $height, $width');

    return Container(
      height: height * 0.7,
      width: width,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          Gaps.v12,
          Container(
            height: Sizes.size5,
            width: Sizes.size48,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(Sizes.size32),
            ),
          ),
          Gaps.v16,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Report',
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Gaps.v10,
          const Divider(thickness: 0.3, height: 0.3),
          const Padding(
            padding: EdgeInsets.all(Sizes.size4),
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: Sizes.size8),
                child: Text(
                  'Why are you reporting this thread?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                'Your report is anonymous, except if you\'re '
                'reporting an intellectual property infringement. If you someone '
                'is in immediate danger, call the local emergency services - don\'t wait',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const Divider(thickness: 0.3, height: 0.3),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(Sizes.size4),
                child: ListTile(
                  title: Text(
                    reportReasons.elementAt(index),
                    style: const TextStyle(fontSize: Sizes.size14),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: Sizes.size20,
                    color: Colors.grey,
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 0.3, height: 0.3),
              itemCount: reportReasons.length,
              // itemCount: reportReasons.length,
            ),
          ),
        ],
      ),
    );
  }
}
