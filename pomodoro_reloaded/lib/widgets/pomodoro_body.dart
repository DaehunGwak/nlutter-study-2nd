import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_reloaded/models/pomodoro_round.dart';
import 'package:pomodoro_reloaded/models/pomodoro_timer.dart';

class PomodoroBody extends StatefulWidget {
  const PomodoroBody({super.key});

  @override
  State<PomodoroBody> createState() => _PomodoroBodyState();
}

/// TODO: 중앙에 오면 선택하는 Minute picker 를 만들고 싶었지만 실패
class _PomodoroBodyState extends State<PomodoroBody> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 180);

  PomodoroTimer _pomodoroTimer = PomodoroTimer();
  PomodoroRoundCounter _roundCounter = PomodoroRoundCounter();
  PomodoroMinuteType _selectedMinuteType = PomodoroMinuteType.twentyFive;
  late Timer _timer;

  void _selectMinuteButton(PomodoroMinuteType minuteType, int index) {
    setState(() {
      _selectedMinuteType = minuteType;
    });
    _scrollController.animateTo(
      0 + index * 90,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Container(
            color: Colors.blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Expanded(child: Text("text"))],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 170),
                for (var i = 0; i < PomodoroMinuteType.values.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 22),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: (_selectedMinuteType ==
                                PomodoroMinuteType.values[i])
                            ? Colors.white
                            : Colors.transparent,
                        border: Border.all(
                          color: Colors.white54,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _selectMinuteButton(PomodoroMinuteType.values[i], i);
                        },
                        child: Text(
                          "${PomodoroMinuteType.values[i].minutes}",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: (_selectedMinuteType ==
                                    PomodoroMinuteType.values[i])
                                ? Theme.of(context).colorScheme.background
                                : Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 170),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ],
    );
  }
}
