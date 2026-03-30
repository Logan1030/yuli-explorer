import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../providers/game_provider.dart';

class ResultScreen extends StatefulWidget {
  final String subject;
  final int level;
  final int stars;

  const ResultScreen({
    super.key,
    required this.subject,
    required this.level,
    required this.stars,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with TickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _starAnimationController;
  late Animation<double> _starAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _starAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _starAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _starAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // 播放动画
    _confettiController.play();
    _starAnimationController.forward();

    // 保存成绩
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GameProvider>().completeLevel(widget.subject, widget.level, widget.stars);
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _starAnimationController.dispose();
    super.dispose();
  }

  Color get _color {
    switch (widget.subject) {
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

  String get _subjectName {
    switch (widget.subject) {
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

  String get _encouragement {
    if (widget.stars >= 3) return '太棒了！你是最棒的！🌟';
    if (widget.stars >= 2) return '很好！继续保持！👍';
    if (widget.stars >= 1) return '不错！再接再厉！💪';
    return '加油！你可以的！🎯';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_color.withValues(alpha: 0.2), AppTheme.backgroundColor],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  _buildStars(),
                  const SizedBox(height: 40),
                  _buildMessage(),
                  const Spacer(),
                  _buildButtons(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          // Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                AppTheme.starColor,
                AppTheme.englishColor,
                AppTheme.mathColor,
                AppTheme.chineseColor,
                Colors.pink,
                Colors.orange,
              ],
              numberOfParticles: 30,
              maxBlastForce: 50,
              minBlastForce: 20,
              gravity: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStars() {
    return AnimatedBuilder(
      animation: _starAnimation,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final isEarned = index < widget.stars;
            return Transform.scale(
              scale: isEarned ? _starAnimation.value : 1.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.star,
                  size: isEarned ? 80 : 60,
                  color: isEarned ? AppTheme.starColor : Colors.grey.shade300,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildMessage() {
    return Column(
      children: [
        Text(
          _subjectName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '第 ${widget.level} 关',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Text(
            _encouragement,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          // 再玩一次
          ElevatedButton(
            onPressed: () {
              context.pushReplacement('/quiz/${widget.subject}/${widget.level}');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _color,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              '再玩一次',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // 返回世界地图
          OutlinedButton(
            onPressed: () {
              context.pushReplacement('/world/${widget.subject}');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: _color,
              side: BorderSide(color: _color, width: 2),
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              '返回关卡列表',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // 返回首页
          TextButton(
            onPressed: () {
              context.go('/');
            },
            child: Text(
              '返回首页',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
