import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    super.key,
    required this.isBlackTheme,
  });

  final bool isBlackTheme;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {

  // void tap() {
  //   setState(() {
  //     _isTapped = true;
  //   });
  //   Future.delayed(
  //     const Duration(milliseconds: 200),
  //     () {
  //       setState(() {
  //         _isTapped = false;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.size8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
              height: Sizes.size32,
              width: Sizes.size28,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(Sizes.size11),
              ),
            ),
          ),
          Positioned(
            left: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
              height: Sizes.size32,
              width: Sizes.size28,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(Sizes.size11),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: Sizes.size32,
            width: Sizes.size40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.isBlackTheme ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(Sizes.size9),
            ),
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: widget.isBlackTheme ? Colors.black : Colors.white,
              size: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }
}
