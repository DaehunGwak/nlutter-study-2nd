import 'package:flutter/material.dart';

class ScheduleCardColumn extends StatelessWidget {
  const ScheduleCardColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ScheduleCard(
            backgroundColor: const Color(0xFFFEF754),
            title: "DESIGN\nMEETING",
            startTime: DateTime(2023, 1, 1, 11, 30),
            endTime: DateTime(2023, 1, 1, 12, 20),
            participants: const ["ALEX", "HELENA", "NANA"],
          ),
          ScheduleCard(
            backgroundColor: const Color(0xFF9C6BCE),
            title: "DAILY\nPROJECT",
            startTime: DateTime(2023, 1, 1, 12, 35),
            endTime: DateTime(2023, 1, 1, 14, 10),
            participants: const ["ME", "RICHARD", "CIRY", "+4"],
          ),
          ScheduleCard(
            backgroundColor: const Color(0xFFBCEE4B),
            title: "WEEKLY\nPLANNING",
            startTime: DateTime(2023, 1, 1, 15, 0),
            endTime: DateTime(2023, 1, 1, 16, 30),
            participants: const ["DEN", "NANA", "MARK"],
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard(
      {super.key,
      required this.backgroundColor,
      required this.title,
      required this.startTime,
      required this.endTime,
      this.participants = const []});

  final Color backgroundColor;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> participants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ScheduleTimeText(time: startTime),
                Transform.translate(
                  offset: const Offset(0, -7),
                  child: Transform.scale(
                    scale: 2,
                    child: Text(
                      "|",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                ScheduleTimeText(time: endTime),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w500,
                    height: 0.85,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    for (var participant in participants)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          participant,
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                            color: participant == "ME"
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleTimeText extends StatelessWidget {
  const ScheduleTimeText({
    super.key,
    required this.time,
  });

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          Text(
            time.hour.toString().padLeft(2, "0"),
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
              color: Theme.of(context).colorScheme.tertiary,
              height: 0,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -7),
            child: Text(
              time.minute.toString().padLeft(2, "0"),
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
