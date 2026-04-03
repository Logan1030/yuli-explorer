import 'package:flutter_test/flutter_test.dart';
import 'package:yuli_explorer/core/constants/math_data.dart';

void main() {
  group('数学关卡测试', () {
    test('mathLevels 应该有 16 个关卡', () {
      expect(mathLevels.length, 16);
    });

    test('Level 11 应该有 5 道题', () {
      final level11 = mathLevels.firstWhere((l) => l.level == 11);
      expect(level11.problems.length, 5);
      expect(level11.title, '第十一关：20以内进位加法');
    });

    test('Level 12 应该有 5 道题', () {
      final level12 = mathLevels.firstWhere((l) => l.level == 12);
      expect(level12.problems.length, 5);
      expect(level12.title, '第十二关：20以内退位减法');
    });

    test('Level 13 应该有 5 道题', () {
      final level13 = mathLevels.firstWhere((l) => l.level == 13);
      expect(level13.problems.length, 5);
      expect(level13.title, '第十三关：50以内加减');
    });

    test('Level 14 应该有 5 道题', () {
      final level14 = mathLevels.firstWhere((l) => l.level == 14);
      expect(level14.problems.length, 5);
      expect(level14.title, '第十四关：100以内加减');
    });

    test('Level 15 应该有 5 道题', () {
      final level15 = mathLevels.firstWhere((l) => l.level == 15);
      expect(level15.problems.length, 5);
      expect(level15.title, '第十五关：加减混合');
    });

    test('Level 16 应该有 5 道题', () {
      final level16 = mathLevels.firstWhere((l) => l.level == 16);
      expect(level16.problems.length, 5);
      expect(level16.title, '第十六关：终极挑战');
    });

    test('每道题应该有 4 个选项', () {
      for (var i = 11; i <= 16; i++) {
        final level = mathLevels.firstWhere((l) => l.level == i);
        for (var problem in level.problems) {
          expect(problem.options.length, 4,
              reason: 'Level $i 的题目应该有 4 个选项');
        }
      }
    });

    test('Level 11 加法答案验证', () {
      final level11 = mathLevels.firstWhere((l) => l.level == 11);
      // 8 + 7 = 15
      final q1 = level11.problems[0];
      expect(q1.options[q1.correctIndex], '15');
    });

    test('Level 12 减法答案验证', () {
      final level12 = mathLevels.firstWhere((l) => l.level == 12);
      // 13 - 8 = 5
      final q1 = level12.problems[0];
      expect(q1.options[q1.correctIndex], '5');
    });
  });
}
