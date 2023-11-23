import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_reloaded/models/pomodoro_round.dart';

/// ``
void main() {
  test('라운드 8번 증가하면 골은 2번이다', () {
    // given
    final roundCounter = PomodoroRoundCounter();

    // when
    for (var i = 0; i < 8; i++) {
      roundCounter.count();
    }

    // then
    expect(roundCounter.nowRound, 0);
    expect(roundCounter.nowGoal, 2);
  });

}