class PomodoroRoundCounter {
  static const int roundMax = 4;
  static const int goalMax = 12;

  int _nowRound = 0;
  int _nowGoal = 0;

  void count() {
    _nowRound++;
    if (_nowRound >= roundMax) {
      _nowRound = 0;
      _nowGoal++;
    }
  }

  bool isBreakTiming() =>
      (_nowRound == 0) && (_nowGoal > 0);

  int get nowRound => _nowRound;

  int get nowGoal => _nowGoal;
}
