const int _secondsPerMinute = 60;

class PomodoroTimer {
  static const int _breakSeconds = _secondsPerMinute * 5;

  int _nowSeconds = PomodoroMinuteType.twentyFive.seconds;
  bool _isPlay = false;

  String get nowFormatSeconds =>
      (_nowSeconds % _secondsPerMinute).toString().padLeft(2, '0');

  String get nowFormatMinutes =>
      (_nowSeconds ~/ _secondsPerMinute).toString().padLeft(2, '0');

  int get nowSeconds => _nowSeconds;

  void play() {
    _isPlay = true;
  }

  void count() {
    if (_isPlay && (_nowSeconds > 0)) {
      _nowSeconds--;
    }
  }

  bool isFinished() => _isPlay && (_nowSeconds <= 0);

  void onBreakMode() {
    _nowSeconds = _breakSeconds;
    _isPlay = true;
  }

  void reset(PomodoroMinuteType minuteType) {
    _nowSeconds = PomodoroMinuteType.thirtyFive.seconds;
    _isPlay = false;
  }

  void initSeconds(PomodoroMinuteType minuteType) {
    _nowSeconds = minuteType.seconds;
  }
}

enum PomodoroMinuteType {
  fifteen(15),
  twenty(20),
  twentyFive(25),
  thirty(30),
  thirtyFive(35),
  ;

  final int minutes;

  const PomodoroMinuteType(this.minutes);

  int get seconds => minutes * _secondsPerMinute;
}
