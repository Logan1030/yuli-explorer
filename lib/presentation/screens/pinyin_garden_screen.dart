import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/chinese_data.dart';
import '../providers/game_provider.dart';

class PinyinGardenScreen extends StatelessWidget {
  const PinyinGardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.chineseColor.withValues(alpha: 0.1),
              AppTheme.backgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(child: _buildPinyinGrid(context)),
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
              child: Icon(Icons.arrow_back, color: AppTheme.chineseColor),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            '🔤',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '拼音花园',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Pinyin Garden',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPinyinGrid(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, provider, _) {
        final subject = 'pinyin';
        final unlockedLevels = provider.unlockedLevels[subject] ?? List.filled(4, true);

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: pinyinChapters.length,
          itemBuilder: (context, index) {
            final chapter = pinyinChapters[index];
            final isUnlocked = unlockedLevels[index];
            final stars = provider.getStarsForLevel(subject, index + 1);

            return _PinyinCard(
              chapter: chapter,
              isUnlocked: isUnlocked,
              stars: stars,
              onTap: isUnlocked
                  ? () => context.push('/quiz/pinyin/${index + 1}')
                  : null,
            );
          },
        );
      },
    );
  }
}

class _PinyinCard extends StatelessWidget {
  final PinyinChapter chapter;
  final bool isUnlocked;
  final int stars;
  final VoidCallback? onTap;

  const _PinyinCard({
    required this.chapter,
    required this.isUnlocked,
    required this.stars,
    this.onTap,
  });

  String get _emoji {
    switch (chapter.quizType) {
      case PinyinQuizType.initials:
        return '📣';
      case PinyinQuizType.vowels:
        return '🗣️';
      case PinyinQuizType.tones:
        return '🎵';
      case PinyinQuizType.wholeRead:
        return '📖';
      case PinyinQuizType.syllables:
        return '🔗';
    }
  }

  String get _subtitle {
    switch (chapter.quizType) {
      case PinyinQuizType.initials:
        return '23个声母';
      case PinyinQuizType.vowels:
        return '6个单韵母';
      case PinyinQuizType.tones:
        return '四声+轻声';
      case PinyinQuizType.wholeRead:
        return '16个整体认读';
      case PinyinQuizType.syllables:
        return '音节组合';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isUnlocked ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isUnlocked
              ? [
                  BoxShadow(
                    color: AppTheme.chineseColor.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _emoji,
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    chapter.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isUnlocked ? AppTheme.textPrimary : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isUnlocked ? AppTheme.textSecondary : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isUnlocked) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (i) => Icon(
                          Icons.star,
                          size: 20,
                          color: i < stars ? AppTheme.starColor : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (!isUnlocked)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(Icons.lock, color: Colors.grey, size: 32),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
