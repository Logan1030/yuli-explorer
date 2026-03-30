class EnglishChapter {
  final int chapter;
  final String title;
  final List<EnglishWord> words;

  const EnglishChapter({
    required this.chapter,
    required this.title,
    required this.words,
  });
}

class EnglishWord {
  final String english;
  final String chinese;
  final String? pronunciation;

  const EnglishWord({
    required this.english,
    required this.chinese,
    this.pronunciation,
  });
}

const englishChapters = [
  EnglishChapter(
    chapter: 1,
    title: '第一章：基础词汇',
    words: [
      EnglishWord(english: 'apple', chinese: '苹果'),
      EnglishWord(english: 'banana', chinese: '香蕉'),
      EnglishWord(english: 'cat', chinese: '猫'),
      EnglishWord(english: 'dog', chinese: '狗'),
      EnglishWord(english: 'egg', chinese: '鸡蛋'),
      EnglishWord(english: 'fish', chinese: '鱼'),
      EnglishWord(english: 'grape', chinese: '葡萄'),
      EnglishWord(english: 'house', chinese: '房子'),
    ],
  ),
  EnglishChapter(
    chapter: 2,
    title: '第二章：动物世界',
    words: [
      EnglishWord(english: 'elephant', chinese: '大象'),
      EnglishWord(english: 'tiger', chinese: '老虎'),
      EnglishWord(english: 'lion', chinese: '狮子'),
      EnglishWord(english: 'monkey', chinese: '猴子'),
      EnglishWord(english: 'rabbit', chinese: '兔子'),
      EnglishWord(english: 'panda', chinese: '熊猫'),
      EnglishWord(english: 'bear', chinese: '熊'),
      EnglishWord(english: 'bird', chinese: '鸟'),
    ],
  ),
  EnglishChapter(
    chapter: 3,
    title: '第三章：数字颜色',
    words: [
      EnglishWord(english: 'one', chinese: '一'),
      EnglishWord(english: 'two', chinese: '二'),
      EnglishWord(english: 'three', chinese: '三'),
      EnglishWord(english: 'four', chinese: '四'),
      EnglishWord(english: 'five', chinese: '五'),
      EnglishWord(english: 'red', chinese: '红色'),
      EnglishWord(english: 'blue', chinese: '蓝色'),
      EnglishWord(english: 'green', chinese: '绿色'),
    ],
  ),
  EnglishChapter(
    chapter: 4,
    title: '第四章：家庭成员',
    words: [
      EnglishWord(english: 'father', chinese: '爸爸'),
      EnglishWord(english: 'mother', chinese: '妈妈'),
      EnglishWord(english: 'brother', chinese: '兄弟'),
      EnglishWord(english: 'sister', chinese: '姐妹'),
      EnglishWord(english: 'grandma', chinese: '奶奶'),
      EnglishWord(english: 'grandpa', chinese: '爷爷'),
      EnglishWord(english: 'friend', chinese: '朋友'),
      EnglishWord(english: 'teacher', chinese: '老师'),
    ],
  ),
  EnglishChapter(
    chapter: 5,
    title: '第五章：自然世界',
    words: [
      EnglishWord(english: 'sun', chinese: '太阳'),
      EnglishWord(english: 'moon', chinese: '月亮'),
      EnglishWord(english: 'star', chinese: '星星'),
      EnglishWord(english: 'tree', chinese: '树'),
      EnglishWord(english: 'flower', chinese: '花'),
      EnglishWord(english: 'water', chinese: '水'),
      EnglishWord(english: 'fire', chinese: '火'),
      EnglishWord(english: 'mountain', chinese: '山'),
    ],
  ),
];
