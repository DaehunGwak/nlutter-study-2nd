import 'package:flutter/material.dart';

class ScheduleCardColumn extends StatelessWidget {
  const ScheduleCardColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ScheduleCard(),
        ScheduleCard(),
        ScheduleCard(),
      ],
    );
  }
}


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
