import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GameProvider extends ChangeNotifier {
  static const String _boxName = 'game_progress';

  // 总星星数
  int _totalStars = 0;
  int get totalStars => _totalStars;

  // 各科目星星数
  int _englishStars = 0;
  int get englishStars => _englishStars;

  int _mathStars = 0;
  int get mathStars => _mathStars;

  int _chineseStars = 0;
  int get chineseStars => _chineseStars;

  int _pinyinStars = 0;
  int get pinyinStars => _pinyinStars;

  // 各科目解锁状态
  Map<String, List<bool>> _unlockedLevels = {
    'english': List.generate(8, (i) => i == 0),  // 第一章解锁
    'math': List.generate(16, (i) => i == 0),    // 第一关解锁
    'chinese': List.generate(5, (i) => i == 0),  // 第一章解锁
    'pinyin': List.generate(4, (i) => i == 0),   // 第一章解锁
  };

  Map<String, List<bool>> get unlockedLevels => _unlockedLevels;

  // 各科目每关获得的星星
  Map<String, List<int>> _levelStars = {
    'english': List.filled(8, 0),
    'math': List.filled(16, 0),
    'chinese': List.filled(5, 0),
    'pinyin': List.filled(4, 0),
  };

  Map<String, List<int>> get levelStars => _levelStars;

  Box? _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
    await _loadProgress();
  }

  Future<void> _loadProgress() async {
    if (_box == null) return;

    _totalStars = _box!.get('totalStars', defaultValue: 0);
    _englishStars = _box!.get('englishStars', defaultValue: 0);
    _mathStars = _box!.get('mathStars', defaultValue: 0);
    _chineseStars = _box!.get('chineseStars', defaultValue: 0);
    _pinyinStars = _box!.get('pinyinStars', defaultValue: 0);

    // 加载解锁状态
    final englishUnlocked = _box!.get('englishUnlocked');
    if (englishUnlocked != null) {
      _unlockedLevels['english'] = List<bool>.from(englishUnlocked);
    }

    final mathUnlocked = _box!.get('mathUnlocked');
    if (mathUnlocked != null) {
      _unlockedLevels['math'] = List<bool>.from(mathUnlocked);
    }

    final chineseUnlocked = _box!.get('chineseUnlocked');
    if (chineseUnlocked != null) {
      _unlockedLevels['chinese'] = List<bool>.from(chineseUnlocked);
    }

    final pinyinUnlocked = _box!.get('pinyinUnlocked');
    if (pinyinUnlocked != null) {
      _unlockedLevels['pinyin'] = List<bool>.from(pinyinUnlocked);
    }

    // 加载关卡星星
    final englishLevelStars = _box!.get('englishLevelStars');
    if (englishLevelStars != null) {
      _levelStars['english'] = List<int>.from(englishLevelStars);
    }

    final mathLevelStars = _box!.get('mathLevelStars');
    if (mathLevelStars != null) {
      _levelStars['math'] = List<int>.from(mathLevelStars);
    }

    final chineseLevelStars = _box!.get('chineseLevelStars');
    if (chineseLevelStars != null) {
      _levelStars['chinese'] = List<int>.from(chineseLevelStars);
    }

    final pinyinLevelStars = _box!.get('pinyinLevelStars');
    if (pinyinLevelStars != null) {
      _levelStars['pinyin'] = List<int>.from(pinyinLevelStars);
    }

    notifyListeners();
  }

  Future<void> _saveProgress() async {
    if (_box == null) return;

    await _box!.put('totalStars', _totalStars);
    await _box!.put('englishStars', _englishStars);
    await _box!.put('mathStars', _mathStars);
    await _box!.put('chineseStars', _chineseStars);
    await _box!.put('pinyinStars', _pinyinStars);
    await _box!.put('englishUnlocked', _unlockedLevels['english']);
    await _box!.put('mathUnlocked', _unlockedLevels['math']);
    await _box!.put('chineseUnlocked', _unlockedLevels['chinese']);
    await _box!.put('pinyinUnlocked', _unlockedLevels['pinyin']);
    await _box!.put('englishLevelStars', _levelStars['english']);
    await _box!.put('mathLevelStars', _levelStars['math']);
    await _box!.put('chineseLevelStars', _levelStars['chinese']);
    await _box!.put('pinyinLevelStars', _levelStars['pinyin']);
  }

  bool isLevelUnlocked(String subject, int level) {
    if (level == 0) return true;
    if (level > 0 && level <= _unlockedLevels[subject]!.length) {
      return _unlockedLevels[subject]![level - 1];
    }
    return false;
  }

  int getStarsForLevel(String subject, int level) {
    if (level > 0 && level <= _levelStars[subject]!.length) {
      return _levelStars[subject]![level - 1];
    }
    return 0;
  }

  Future<void> completeLevel(String subject, int level, int stars) async {
    // 更新星星数
    final oldStars = getStarsForLevel(subject, level);
    if (stars > oldStars) {
      final starDiff = stars - oldStars;
      _totalStars += starDiff;

      switch (subject) {
        case 'english':
          _englishStars += starDiff;
          break;
        case 'math':
          _mathStars += starDiff;
          break;
        case 'chinese':
          _chineseStars += starDiff;
          break;
        case 'pinyin':
          _pinyinStars += starDiff;
          break;
      }

      // 更新关卡星星
      _levelStars[subject]![level - 1] = stars;
    }

    // 解锁下一关
    if (level < _unlockedLevels[subject]!.length) {
      _unlockedLevels[subject]![level] = true;
    }

    await _saveProgress();
    notifyListeners();
  }

  Future<void> resetProgress() async {
    _totalStars = 0;
    _englishStars = 0;
    _mathStars = 0;
    _chineseStars = 0;
    _pinyinStars = 0;

    _unlockedLevels = {
      'english': List.generate(8, (i) => i == 0),
      'math': List.generate(16, (i) => i == 0),
      'chinese': List.generate(5, (i) => i == 0),
      'pinyin': List.generate(4, (i) => i == 0),
    };

    _levelStars = {
      'english': List.filled(8, 0),
      'math': List.filled(16, 0),
      'chinese': List.filled(5, 0),
      'pinyin': List.filled(4, 0),
    };

    await _saveProgress();
    notifyListeners();
  }
}
