import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../providers/game_provider.dart';

class StarsScreen extends StatelessWidget {
  const StarsScreen({super.key});

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
              Expanded(child: _buildContent(context)),
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
          const Text('⭐', style: TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Text(
            '星星收集',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 大星星展示
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                      color: AppTheme.starColor.withValues(alpha: 0.4),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 64),
                    const SizedBox(height: 12),
                    Text(
                      '${provider.totalStars}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '星星总数',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // 鼓励语
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
                  children: [
                    Text(
                      _getEncouragement(provider.totalStars),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // 各科目进度
              _SubjectProgressCard(
                emoji: '🏰',
                title: '英语城堡',
                stars: provider.englishStars,
                maxStars: 15 * 3, // 5章 × 3星
                color: AppTheme.englishColor,
                progress: provider.englishStars / (5 * 3),
              ),
              const SizedBox(height: 16),
              _SubjectProgressCard(
                emoji: '🔢',
                title: '数学迷宫',
                stars: provider.mathStars,
                maxStars: 10 * 3, // 10关 × 3星
                color: AppTheme.mathColor,
                progress: provider.mathStars / (10 * 3),
              ),
              const SizedBox(height: 16),
              _SubjectProgressCard(
                emoji: '✏️',
                title: '语文花园',
                stars: provider.chineseStars,
                maxStars: 5 * 3, // 5章 × 3星
                color: AppTheme.chineseColor,
                progress: provider.chineseStars / (5 * 3),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getEncouragement(int stars) {
    if (stars >= 100) return '🌟🌟🌟 你是学习小达人！太厉害了！';
    if (stars >= 50) return '🌟🌟 继续保持，你是最棒的！';
    if (stars >= 20) return '🌟 很棒！继续加油！';
    if (stars >= 10) return '👍 不错的开始！';
    if (stars >= 5) return '💪 继续努力！';
    return '🎯 加油开始你的学习之旅！';
  }
}

class _SubjectProgressCard extends StatelessWidget {
  final String emoji;
  final String title;
  final int stars;
  final int maxStars;
  final Color color;
  final double progress;

  const _SubjectProgressCard({
    required this.emoji,
    required this.title,
    required this.stars,
    required this.maxStars,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(emoji, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.star, color: AppTheme.starColor, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '$stars / $maxStars',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(progress * 100).toInt()}% 完成',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
