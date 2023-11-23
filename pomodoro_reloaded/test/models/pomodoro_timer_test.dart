import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_reloaded/models/pomodoro_timer.dart';

void main() {
  test('15분 초기화 후 15분 카운팅이 되면 isFinished 가 true 이다', () {
    // given
    final timer = PomodoroTimer();
    timer.initSeconds(PomodoroMinuteType.fifteen);

    // when
    timer.play();
    for (var i = 0; i < PomodoroMinuteType.fifteen.seconds; i++) {
      timer.count();
    }

    // then
    expect(timer.isFinished(), true);
  });
}