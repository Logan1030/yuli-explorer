import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../providers/game_provider.dart';

class WorldMapScreen extends StatelessWidget {
  final String subject;

  const WorldMapScreen({super.key, required this.subject});

  String get _title {
    switch (subject) {
      case 'english':
        return '英语城堡';
      case 'math':
        return '数学迷宫';
      case 'chinese':
        return '语文花园';
      default:
        return '';
    }
  }

  String get _subtitle {
    switch (subject) {
      case 'english':
        return 'English Castle';
      case 'math':
        return 'Math Maze';
      case 'chinese':
        return 'Chinese Garden';
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

  String get _emoji {
    switch (subject) {
      case 'english':
        return '🏰';
      case 'math':
        return '🔢';
      case 'chinese':
        return '✏️';
      default:
        return '📚';
    }
  }

  int get _totalLevels {
    switch (subject) {
      case 'english':
        return 5;
      case 'math':
        return 10;
      case 'chinese':
        return 5;
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
              Expanded(child: _buildLevelGrid(context)),
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
          Text(
            _emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelGrid(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, provider, _) {
        final unlockedLevels = provider.unlockedLevels[subject]!;

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: _totalLevels,
          itemBuilder: (context, index) {
            final isUnlocked = unlockedLevels[index];
            final stars = provider.getStarsForLevel(subject, index + 1);

            return _LevelCard(
              level: index + 1,
              isUnlocked: isUnlocked,
              stars: stars,
              color: _color,
              onTap: isUnlocked
                  ? () => context.push('/levels/$subject/${index + 1}')
                  : null,
            );
          },
        );
      },
    );
  }
}

class _LevelCard extends StatelessWidget {
  final int level;
  final bool isUnlocked;
  final int stars;
  final Color color;
  final VoidCallback? onTap;

  const _LevelCard({
    required this.level,
    required this.isUnlocked,
    required this.stars,
    required this.color,
    this.onTap,
  });

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
                    color: color.withValues(alpha: 0.2),
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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isUnlocked ? color : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isUnlocked
                          ? Text(
                              '$level',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Icon(Icons.lock, color: Colors.white),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
