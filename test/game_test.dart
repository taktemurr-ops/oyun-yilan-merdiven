import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yilan_merdiven/oyun_yilan_merdiven.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yilanConfig.title.length, 33);
    expect(yilanConfig.tagline.length, 33);
    for (final s in yilanConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: yilanId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = yilanRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
