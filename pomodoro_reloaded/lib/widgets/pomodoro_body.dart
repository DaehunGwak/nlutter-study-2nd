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

  final PomodoroTimer _pomodoroTimer = PomodoroTimer();
  final PomodoroRoundCounter _roundCounter = PomodoroRoundCounter();
  PomodoroMinuteType _selectedMinuteType = PomodoroMinuteType.twentyFive;
  late Timer _timer;

  void _selectMinuteButton(PomodoroMinuteType minuteType, int index) {
    setState(() {
      _selectedMinuteType = minuteType;
      _pomodoroTimer.initSeconds(minuteType);
    });
    _scrollController.animateTo(
      0 + index * 90,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onStart() {
    setState(() {
      _timer = Timer.periodic(const Duration(milliseconds: 5), _tick);
      _pomodoroTimer.play();
    });
  }

  void _tick(Timer timer) {
    setState(() {
      if (_pomodoroTimer.isBreakFinished()) {
        _pomodoroTimer.reset(_selectedMinuteType);
        _timer.cancel();
      }
      if (_pomodoroTimer.isFinished()) {
        _pomodoroTimer.onBreakMode();
        _roundCounter.count();
        return;
      }
      _pomodoroTimer.count();
    });
  }

  void _onPause() {
    setState(() {
      _pomodoroTimer.pause();
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //// timer view ////////////
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _pomodoroTimer.isFocus
                    ? const Text('')
                    : const Text(
                        '🫠',
                        style: TextStyle(fontSize: 60),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PomodoroTimeCard(time: _pomodoroTimer.nowFormatMinutes),
                    const Text(
                      ' : ',
                      style: TextStyle(
                        fontSize: 82,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -8,
                      ),
                    ),
                    PomodoroTimeCard(time: _pomodoroTimer.nowFormatSeconds),
                  ],
                ),
              ],
            ),
          ),
        ),
        //// minute picker /////////
        Flexible(
          flex: 2,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.background.withOpacity(0.0),
                    Theme.of(context).colorScheme.background.withOpacity(0.0),
                    Theme.of(context).colorScheme.background.withOpacity(0.0),
                    Theme.of(context).colorScheme.background,
                  ]),
            ),
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 170),
                for (var i = 0; i < PomodoroMinuteType.values.length; i++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 56, 5, 4),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
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
        //// play & pause button ///
        Flexible(
          flex: 4,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            alignment: Alignment.bottomCenter,
            child: _pomodoroTimer.isPlay
                ? IconButton(
                    onPressed: _onPause,
                    icon: const Icon(
                      Icons.pause_circle,
                      size: 150,
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: _onStart,
                    icon: const Icon(
                      Icons.play_circle_outline,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        //// bottom board //////////
        Flexible(
          flex: 3,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: PomodoroBottomBoard(
              nowRound: _roundCounter.nowRound,
              nowGoal: _roundCounter.nowGoal,
            ),
          ),
        ),
      ],
    );
  }
}

class PomodoroTimeCard extends StatelessWidget {
  const PomodoroTimeCard({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Transform.translate(
            offset: const Offset(0, -45),
            child: Container(
              width: 150,
              height: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
          ),
        ),
        Transform.scale(
          scale: 0.9,
          child: Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              width: 150,
              height: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 200,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 82,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        )
      ],
    );
  }
}

class PomodoroBottomBoard extends StatelessWidget {
  const PomodoroBottomBoard({
    super.key,
    required this.nowRound,
    required this.nowGoal,
  });

  final int nowRound;
  final int nowGoal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildColumn(
            now: nowRound,
            max: PomodoroRoundCounter.roundMax,
            text: "ROUND",
          ),
        ),
        Expanded(
          child: _buildColumn(
            now: nowGoal,
            max: PomodoroRoundCounter.goalMax,
            text: "GOAL",
          ),
        ),
      ],
    );
  }

  Column _buildColumn({
    required int now,
    required int max,
    required String text,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$now/$max',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}
