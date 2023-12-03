import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class Logo {
  Logo._();

  static const twitter = FaIcon(
    FontAwesomeIcons.twitter,
    size: Sizes.size32,
    color: Colors.blue,
  );

  static const google = FaIcon(
    FontAwesomeIcons.google,
    size: Sizes.size24,
    color: Colors.orangeAccent,
  );

  static const apple = FaIcon(
    FontAwesomeIcons.apple,
    size: Sizes.size24,
    color: Colors.black,
  );
}
