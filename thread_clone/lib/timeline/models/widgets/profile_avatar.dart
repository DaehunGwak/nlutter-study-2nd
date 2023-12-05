import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey,
      foregroundImage: NetworkImage(imageUrl),
      child: const FaIcon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
    );
  }
}
