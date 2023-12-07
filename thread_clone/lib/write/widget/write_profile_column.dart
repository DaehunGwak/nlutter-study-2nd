import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';

import '../../constants/sizes.dart';

class WriteProfileColumn extends StatelessWidget {
  const WriteProfileColumn({
    super.key,
    required String imageUrl,
  }) : _imageUrl = imageUrl;

  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: Sizes.size24,
          backgroundColor: Colors.grey,
          foregroundImage: NetworkImage(_imageUrl),
          child: const FaIcon(
            FontAwesomeIcons.user,
            color: Colors.white,
          ),
        ),
        Gaps.v10,
        SizedBox(
          height: Sizes.size52,
          child: VerticalDivider(
            thickness: 3,
            color: Colors.grey.shade300,
          ),
        ),
        Gaps.v10,
        Stack(
          children: [
            CircleAvatar(
              radius: Sizes.size10,
              backgroundColor: Colors.grey,
              foregroundImage: NetworkImage(_imageUrl),
            ),
            Container(
              width: Sizes.size20,
              height: Sizes.size20,
              color: Colors.white.withOpacity(0.5),
            ),
          ],
        ),
      ],
    );
  }
}
