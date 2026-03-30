import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/english_data.dart';
import '../../core/constants/math_data.dart';
import '../../core/constants/chinese_data.dart';
import '../providers/game_provider.dart';

class LevelListScreen extends StatelessWidget {
  final String subject;
  final int chapter;

  const LevelListScreen({
    super.key,
    required this.subject,
    required this.chapter,
  });

  String get _title {
    switch (subject) {
      case 'english':
        return englishChapters[chapter - 1].title;
      case 'math':
        return mathLevels[chapter - 1].title;
      case 'chinese':
        return chineseChapters[chapter - 1].title;
      default:
        return '';
    }
  }

  Color get _color {
    switch (subject) {
      case 'english':
        return AppTheme.englishColor;
      case 'math':
        return AppTheme.mathColor;
      case 'chinese':
        return AppTheme.chineseColor;
      default:
        return AppTheme.englishColor;
    }
  }

  int get _totalLevels {
    switch (subject) {
      case 'english':
        return englishChapters[chapter - 1].words.length;
      case 'math':
        return mathLevels[chapter - 1].problems.length;
      case 'chinese':
        return chineseChapters[chapter - 1].characters.length;
      default:
        return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_color.withValues(alpha: 0.1), AppTheme.backgroundColor],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(child: _buildLevelList(context)),
              _buildStartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Icon(Icons.arrow_back, color: _color),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '共 $_totalLevels 题',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _totalLevels,
      itemBuilder: (context, index) {
        return _LevelItem(
          index: index,
          color: _color,
          subject: subject,
          chapter: chapter,
        );
      },
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => context.push('/quiz/$subject/$chapter'),
        style: ElevatedButton.styleFrom(
          backgroundColor: _color,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          '开始学习',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _LevelItem extends StatelessWidget {
  final int index;
  final Color color;
  final String subject;
  final int chapter;

  const _LevelItem({
    required this.index,
    required this.color,
    required this.subject,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    String itemText = '';
    switch (subject) {
      case 'english':
        itemText = englishChapters[chapter - 1].words[index].english;
        break;
      case 'math':
        itemText = mathLevels[chapter - 1].problems[index].question;
        break;
      case 'chinese':
        itemText = chineseChapters[chapter - 1].characters[index].character;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              itemText,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.check_circle, color: color.withValues(alpha: 0.5)),
        ],
      ),
    );
  }
}
