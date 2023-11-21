import 'package:flutter/material.dart';

class SideScrollDateBar extends StatelessWidget {
  const SideScrollDateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MONDAY 16",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ScheduleDayText(
                  "TODAY",
                  fontColor: Theme.of(context).colorScheme.primary,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color: Color(0xFFB22580),
                  ),
                ),
                for (var i = 17; i <= 31; i++)
                  ScheduleDayText(
                    "$i",
                    paddingRight: 20,
                    fontColor: Theme.of(context).colorScheme.secondary,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ScheduleDayText extends StatelessWidget {
  const ScheduleDayText(
    this.data, {
    super.key,
    this.paddingRight = 0,
    required this.fontColor,
  });

  final String data;
  final double paddingRight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, paddingRight, 0),
      child: Text(
        data,
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          color: fontColor,
        ),
      ),
    );
  }
}
