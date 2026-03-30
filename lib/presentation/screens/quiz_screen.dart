import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/english_data.dart';
import '../../core/constants/math_data.dart';
import '../../core/constants/chinese_data.dart';
import '../providers/game_provider.dart';
import '../widgets/option_button.dart';

class QuizScreen extends StatefulWidget {
  final String subject;
  final int level;

  const QuizScreen({
    super.key,
    required this.subject,
    required this.level,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  int _currentIndex = 0;
  int _correctCount = 0;
  int? _selectedAnswer;
  bool _showFeedback = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
  }

  @override
  void dispose() {
    _flutterTts.stop();
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

  int get _totalQuestions {
    switch (widget.subject) {
      case 'english':
        return englishChapters[widget.level - 1].words.length;
      case 'math':
        return mathLevels[widget.level - 1].problems.length;
      case 'chinese':
        return chineseChapters[widget.level - 1].characters.length;
      default:
        return 5;
    }
  }

  String get _questionText {
    switch (widget.subject) {
      case 'english':
        return englishChapters[widget.level - 1].words[_currentIndex].english;
      case 'math':
        return mathLevels[widget.level - 1].problems[_currentIndex].question;
      case 'chinese':
        return chineseChapters[widget.level - 1].characters[_currentIndex].character;
      default:
        return '';
    }
  }

  String get _answerText {
    switch (widget.subject) {
      case 'english':
        return englishChapters[widget.level - 1].words[_currentIndex].chinese;
      case 'math':
        return mathLevels[widget.level - 1].problems[_currentIndex]
            .options[mathLevels[widget.level - 1].problems[_currentIndex].correctIndex];
      case 'chinese':
        return chineseChapters[widget.level - 1].characters[_currentIndex].pinyin;
      default:
        return '';
    }
  }

  List<String> get _options {
    switch (widget.subject) {
      case 'english':
        final words = englishChapters[widget.level - 1].words;
        return words.map((w) => w.chinese).toList();
      case 'math':
        return mathLevels[widget.level - 1].problems[_currentIndex].options;
      case 'chinese':
        final chars = chineseChapters[widget.level - 1].characters;
        return chars.map((c) => c.pinyin).toList();
      default:
        return [];
    }
  }

  int get _correctIndex {
    switch (widget.subject) {
      case 'english':
        return 0; // 中文答案是第一个选项
      case 'math':
        return mathLevels[widget.level - 1].problems[_currentIndex].correctIndex;
      case 'chinese':
        return 0; // 拼音答案是第一个选项
      default:
        return 0;
    }
  }

  void _speak() async {
    switch (widget.subject) {
      case 'english':
        await _flutterTts.speak(_questionText);
        break;
      case 'chinese':
        await _flutterTts.setLanguage('zh-CN');
        await _flutterTts.speak(_questionText);
        break;
    }
  }

  void _selectAnswer(int index) {
    if (_showFeedback) return;

    setState(() {
      _selectedAnswer = index;
      _showFeedback = true;
      if (index == _correctIndex) {
        _correctCount++;
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (_currentIndex < _totalQuestions - 1) {
        setState(() {
          _currentIndex++;
          _selectedAnswer = null;
          _showFeedback = false;
        });
      } else {
        _finishQuiz();
      }
    });
  }

  void _finishQuiz() {
    final stars = _calculateStars();
    context.read<GameProvider>().completeLevel(widget.subject, widget.level, stars);
    context.pushReplacement('/result/${widget.subject}/${widget.level}?stars=$stars');
  }

  int _calculateStars() {
    final percentage = _correctCount / _totalQuestions;
    if (percentage >= 0.9) return 3;
    if (percentage >= 0.6) return 2;
    if (percentage >= 0.3) return 1;
    return 0;
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
              _buildHeader(),
              _buildProgress(),
              Expanded(child: _buildQuestion()),
              _buildOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
              child: Icon(Icons.close, color: _color),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${_currentIndex + 1} / $_totalQuestions',
              style: TextStyle(
                color: _color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: (_currentIndex + 1) / _totalQuestions,
        child: Container(
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.subject == 'english' || widget.subject == 'chinese')
          GestureDetector(
            onTap: _speak,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _color.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    _questionText,
                    style: TextStyle(
                      fontSize: widget.subject == 'chinese' ? 64 : 48,
                      fontWeight: FontWeight.bold,
                      color: _color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Icon(Icons.volume_up, color: _color, size: 32),
                ],
              ),
            ),
          )
        else
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: _color.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Text(
              _questionText,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: _color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        const SizedBox(height: 20),
        if (_showFeedback)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: _selectedAnswer == _correctIndex
                  ? AppTheme.successColor
                  : AppTheme.errorColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _selectedAnswer == _correctIndex ? '正确！' : '错误！答案是：$_answerText',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOptions() {
    final options = _options;

    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedAnswer == index;
          final isCorrect = index == _correctIndex;

          Color bgColor = Colors.white;
          Color textColor = _color;
          Color borderColor = Colors.grey.shade300;

          if (_showFeedback) {
            if (isCorrect) {
              bgColor = AppTheme.successColor;
              textColor = Colors.white;
              borderColor = AppTheme.successColor;
            } else if (isSelected && !isCorrect) {
              bgColor = AppTheme.errorColor;
              textColor = Colors.white;
              borderColor = AppTheme.errorColor;
            }
          } else if (isSelected) {
            borderColor = _color;
          }

          return GestureDetector(
            onTap: () => _selectAnswer(index),
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  options[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
