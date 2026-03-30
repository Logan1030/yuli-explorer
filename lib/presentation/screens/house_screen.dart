import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../providers/game_provider.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF8E7), AppTheme.backgroundColor],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(child: _buildHouse(context)),
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
              child: const Icon(Icons.arrow_back),
            ),
          ),
          const SizedBox(width: 16),
          const Text('🏠', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Text(
            '我的小窝',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHouse(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 星星总览卡片
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.starColor.withValues(alpha: 0.8),
                      AppTheme.starColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.starColor.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      '${provider.totalStars}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '星星总数',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // 各科目星星
              Row(
                children: [
                  Expanded(
                    child: _SubjectStarCard(
                      emoji: '🏰',
                      title: '英语',
                      stars: provider.englishStars,
                      color: AppTheme.englishColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SubjectStarCard(
                      emoji: '🔢',
                      title: '数学',
                      stars: provider.mathStars,
                      color: AppTheme.mathColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SubjectStarCard(
                      emoji: '✏️',
                      title: '语文',
                      stars: provider.chineseStars,
                      color: AppTheme.chineseColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // 装饰品区域
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('🎨', style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 8),
                        Text(
                          '我的收藏',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      children: [
                        _CollectibleItem(emoji: '🏆', isUnlocked: provider.totalStars >= 10),
                        _CollectibleItem(emoji: '🎖️', isUnlocked: provider.totalStars >= 20),
                        _CollectibleItem(emoji: '🏅', isUnlocked: provider.totalStars >= 30),
                        _CollectibleItem(emoji: '🎁', isUnlocked: provider.totalStars >= 50),
                        _CollectibleItem(emoji: '🌟', isUnlocked: provider.totalStars >= 3),
                        _CollectibleItem(emoji: '💎', isUnlocked: provider.totalStars >= 5),
                        _CollectibleItem(emoji: '👑', isUnlocked: provider.totalStars >= 10),
                        _CollectibleItem(emoji: '🎯', isUnlocked: provider.totalStars >= 15),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SubjectStarCard extends StatelessWidget {
  final String emoji;
  final String title;
  final int stars;
  final Color color;

  const _SubjectStarCard({
    required this.emoji,
    required this.title,
    required this.stars,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            '$stars',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _CollectibleItem extends StatelessWidget {
  final String emoji;
  final bool isUnlocked;

  const _CollectibleItem({
    required this.emoji,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isUnlocked ? Colors.white : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUnlocked ? AppTheme.starColor.withValues(alpha: 0.5) : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          isUnlocked ? emoji : '🔒',
          style: TextStyle(
            fontSize: 24,
            color: isUnlocked ? null : Colors.grey,
          ),
        ),
      ),
    );
  }
}
