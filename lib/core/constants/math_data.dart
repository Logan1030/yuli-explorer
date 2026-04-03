class MathLevel {
  final int level;
  final String title;
  final List<MathProblem> problems;

  const MathLevel({
    required this.level,
    required this.title,
    required this.problems,
  });
}

class MathProblem {
  final String question;
  final List<String> options;
  final int correctIndex;

  const MathProblem({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

const mathLevels = [
  MathLevel(
    level: 1,
    title: '第一关：10以内加法',
    problems: [
      MathProblem(question: '1 + 1 = ?', options: ['1', '2', '3', '4'], correctIndex: 1),
      MathProblem(question: '1 + 2 = ?', options: ['2', '3', '4', '5'], correctIndex: 1),
      MathProblem(question: '2 + 3 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '1 + 3 = ?', options: ['3', '4', '5', '6'], correctIndex: 1),
      MathProblem(question: '2 + 2 = ?', options: ['3', '4', '5', '6'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 2,
    title: '第二关：10以内减法',
    problems: [
      MathProblem(question: '3 - 1 = ?', options: ['1', '2', '3', '4'], correctIndex: 1),
      MathProblem(question: '5 - 2 = ?', options: ['2', '3', '4', '5'], correctIndex: 1),
      MathProblem(question: '4 - 1 = ?', options: ['2', '3', '4', '5'], correctIndex: 1),
      MathProblem(question: '6 - 3 = ?', options: ['2', '3', '4', '5'], correctIndex: 1),
      MathProblem(question: '7 - 2 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 3,
    title: '第三关：20以内加法',
    problems: [
      MathProblem(question: '10 + 5 = ?', options: ['14', '15', '16', '17'], correctIndex: 1),
      MathProblem(question: '12 + 3 = ?', options: ['14', '15', '16', '17'], correctIndex: 1),
      MathProblem(question: '8 + 7 = ?', options: ['14', '15', '16', '17'], correctIndex: 1),
      MathProblem(question: '9 + 6 = ?', options: ['14', '15', '16', '17'], correctIndex: 1),
      MathProblem(question: '11 + 4 = ?', options: ['14', '15', '16', '17'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 4,
    title: '第四关：20以内减法',
    problems: [
      MathProblem(question: '15 - 3 = ?', options: ['10', '11', '12', '13'], correctIndex: 2),
      MathProblem(question: '18 - 5 = ?', options: ['12', '13', '14', '15'], correctIndex: 1),
      MathProblem(question: '14 - 6 = ?', options: ['7', '8', '9', '10'], correctIndex: 1),
      MathProblem(question: '16 - 8 = ?', options: ['7', '8', '9', '10'], correctIndex: 1),
      MathProblem(question: '19 - 7 = ?', options: ['11', '12', '13', '14'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 5,
    title: '第五关：乘法入门',
    problems: [
      MathProblem(question: '2 × 3 = ?', options: ['4', '5', '6', '7'], correctIndex: 2),
      MathProblem(question: '3 × 2 = ?', options: ['4', '5', '6', '7'], correctIndex: 2),
      MathProblem(question: '2 × 4 = ?', options: ['6', '7', '8', '9'], correctIndex: 2),
      MathProblem(question: '1 × 5 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '3 × 3 = ?', options: ['6', '7', '8', '9'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 6,
    title: '第六关：除法入门',
    problems: [
      MathProblem(question: '6 ÷ 2 = ?', options: ['2', '3', '4', '5'], correctIndex: 1),
      MathProblem(question: '8 ÷ 2 = ?', options: ['3', '4', '5', '6'], correctIndex: 1),
      MathProblem(question: '9 ÷ 3 = ?', options: ['2', '3', '4', '5'], correctIndex: 1),
      MathProblem(question: '10 ÷ 2 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '4 ÷ 2 = ?', options: ['1', '2', '3', '4'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 7,
    title: '第七关：大小比较',
    problems: [
      MathProblem(question: '5 ? 3', options: ['<', '=', '>', '×'], correctIndex: 2),
      MathProblem(question: '7 ? 9', options: ['<', '=', '>', '×'], correctIndex: 0),
      MathProblem(question: '4 ? 4', options: ['<', '=', '>', '×'], correctIndex: 1),
      MathProblem(question: '8 ? 6', options: ['<', '=', '>', '×'], correctIndex: 2),
      MathProblem(question: '2 ? 5', options: ['<', '=', '>', '×'], correctIndex: 0),
    ],
  ),
  MathLevel(
    level: 8,
    title: '第八关：序数认知',
    problems: [
      MathProblem(question: '第一个数字是？', options: ['1', '2', '3', '4'], correctIndex: 0),
      MathProblem(question: '第三个数是？', options: ['1', '2', '3', '4'], correctIndex: 2),
      MathProblem(question: '第五个数是？', options: ['3', '4', '5', '6'], correctIndex: 2),
      MathProblem(question: '第二个数是？', options: ['1', '2', '3', '4'], correctIndex: 1),
      MathProblem(question: '第四个数是？', options: ['2', '3', '4', '5'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 9,
    title: '第九关：简单应用',
    problems: [
      MathProblem(question: '小明有3个苹果，又买了2个，一共几个？', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '小红有5个橘子，吃了3个，还剩几个？', options: ['1', '2', '3', '4'], correctIndex: 1),
      MathProblem(question: '有4个小朋友，每人2个糖，一共几颗？', options: ['6', '7', '8', '9'], correctIndex: 2),
      MathProblem(question: '10个苹果平分给2人，每人几个？', options: ['3', '4', '5', '6'], correctIndex: 2),
      MathProblem(question: '6朵花，插在3个花瓶，每瓶几朵？', options: ['1', '2', '3', '4'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 10,
    title: '第十关：综合挑战',
    problems: [
      MathProblem(question: '7 + 8 = ?', options: ['14', '15', '16', '17'], correctIndex: 1),
      MathProblem(question: '13 - 6 = ?', options: ['6', '7', '8', '9'], correctIndex: 1),
      MathProblem(question: '4 × 3 = ?', options: ['10', '11', '12', '13'], correctIndex: 2),
      MathProblem(question: '15 ÷ 3 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '9 + 9 = ?', options: ['16', '17', '18', '19'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 11,
    title: '第十一关：20以内进位加法',
    problems: [
      MathProblem(question: '8 + 7 = ?', options: ['13', '14', '15', '16'], correctIndex: 2),
      MathProblem(question: '9 + 8 = ?', options: ['15', '16', '17', '18'], correctIndex: 2),
      MathProblem(question: '7 + 9 = ?', options: ['14', '15', '16', '17'], correctIndex: 2),
      MathProblem(question: '9 + 6 = ?', options: ['13', '14', '15', '16'], correctIndex: 2),
      MathProblem(question: '8 + 8 = ?', options: ['14', '15', '16', '17'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 12,
    title: '第十二关：20以内退位减法',
    problems: [
      MathProblem(question: '13 - 8 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '15 - 9 = ?', options: ['5', '6', '7', '8'], correctIndex: 1),
      MathProblem(question: '12 - 7 = ?', options: ['4', '5', '6', '7'], correctIndex: 1),
      MathProblem(question: '14 - 8 = ?', options: ['5', '6', '7', '8'], correctIndex: 1),
      MathProblem(question: '16 - 9 = ?', options: ['6', '7', '8', '9'], correctIndex: 1),
    ],
  ),
  MathLevel(
    level: 13,
    title: '第十三关：50以内加减',
    problems: [
      MathProblem(question: '25 + 18 = ?', options: ['41', '42', '43', '44'], correctIndex: 2),
      MathProblem(question: '47 - 19 = ?', options: ['26', '27', '28', '29'], correctIndex: 2),
      MathProblem(question: '36 + 14 = ?', options: ['48', '49', '50', '51'], correctIndex: 2),
      MathProblem(question: '43 - 17 = ?', options: ['24', '25', '26', '27'], correctIndex: 2),
      MathProblem(question: '28 + 17 = ?', options: ['43', '44', '45', '46'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 14,
    title: '第十四关：100以内加减',
    problems: [
      MathProblem(question: '56 + 37 = ?', options: ['91', '92', '93', '94'], correctIndex: 2),
      MathProblem(question: '84 - 29 = ?', options: ['53', '54', '55', '56'], correctIndex: 2),
      MathProblem(question: '45 + 38 = ?', options: ['81', '82', '83', '84'], correctIndex: 2),
      MathProblem(question: '91 - 46 = ?', options: ['43', '44', '45', '46'], correctIndex: 2),
      MathProblem(question: '67 + 28 = ?', options: ['93', '94', '95', '96'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 15,
    title: '第十五关：加减混合',
    problems: [
      MathProblem(question: '15 + 8 - 7 = ?', options: ['14', '15', '16', '17'], correctIndex: 2),
      MathProblem(question: '20 - 6 + 9 = ?', options: ['21', '22', '23', '24'], correctIndex: 2),
      MathProblem(question: '12 + 9 - 8 = ?', options: ['11', '12', '13', '14'], correctIndex: 2),
      MathProblem(question: '25 - 7 + 15 = ?', options: ['31', '32', '33', '34'], correctIndex: 2),
      MathProblem(question: '18 + 14 - 9 = ?', options: ['21', '22', '23', '24'], correctIndex: 2),
    ],
  ),
  MathLevel(
    level: 16,
    title: '第十六关：终极挑战',
    problems: [
      MathProblem(question: '38 + 47 = ?', options: ['83', '84', '85', '86'], correctIndex: 2),
      MathProblem(question: '91 - 58 = ?', options: ['31', '32', '33', '34'], correctIndex: 2),
      MathProblem(question: '56 + 29 - 38 = ?', options: ['45', '46', '47', '48'], correctIndex: 2),
      MathProblem(question: '72 - 35 + 19 = ?', options: ['54', '55', '56', '57'], correctIndex: 2),
      MathProblem(question: '45 + 37 = ?', options: ['80', '81', '82', '83'], correctIndex: 2),
    ],
  ),
];
