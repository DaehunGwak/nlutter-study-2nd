import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScheduleProfileBar extends StatelessWidget {
  const ScheduleProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30,
          foregroundImage: AssetImage("assets/images/profile.png"), // ref: https://eunoia3jy.tistory.com/102
          child: Icon(
            Icons.person,
            size: 30,
          ),
        ),
        Icon(
          Icons.add,
          size: 40,
        ),
      ],
    );
  }
}
