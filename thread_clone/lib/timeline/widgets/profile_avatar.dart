import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.size5),
      child: Stack(
        children: [
          CircleAvatar(
            radius: Sizes.size24,
            backgroundColor: Colors.grey,
            foregroundImage: NetworkImage(imageUrl),
            child: const FaIcon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
          ),
          Transform.translate(
            offset: const Offset(28, 26),
            child: const CircleAvatar(
              radius: Sizes.size12,
              backgroundColor: Colors.white,
              child: FaIcon(
                FontAwesomeIcons.circlePlus,
                color: Colors.black,
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
