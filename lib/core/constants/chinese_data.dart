// ============== 拼音学习体系 ==============

// 声母（23个）
const List<String> initials = [
  'b', 'p', 'm', 'f',
  'd', 't', 'n', 'l',
  'g', 'k', 'h',
  'j', 'q', 'x',
  'zh', 'ch', 'sh', 'r',
  'z', 'c', 's',
  'y', 'w'
];

// 单韵母（6个）
const List<String> simpleVowels = [
  'a', 'o', 'e', 'i', 'u', 'ü'
];

// 复韵母（8个）
const List<String> compoundVowels = [
  'ai', 'ei', 'ui', 'ao', 'ou', 'iu', 'ie', 'üe'
];

// 鼻韵母（9个）
const List<String> nasalVowels = [
  'an', 'en', 'in', 'un', 'ün', 'ang', 'eng', 'ing', 'ong'
];

// 介母（3个）
const List<String> medialVowels = ['i', 'u', 'ü'];

// 声调
const List<String> tones = ['ā', 'á', 'ǎ', 'à', 'a']; // 1-4声 + 轻声

// 整体认读音节（16个）
const List<String> wholeSyllables = [
  'zhi', 'chi', 'shi', 'ri',  // 卷舌音
  'zi', 'ci', 'si',           // 平舌音
  'yi', 'wu', 'yu',           // 元音开头
  'ye', 'yue',                // y + üe
  'yuan',                     // y + uan
  'yin', 'yun', 'ying'        // y + in/ün/ing
];

// 隔音符号（用于分隔音节）
const List<String> syllableSeparators = ['·'];

// 组合规则：声母 + 韵母 = 音节
class PinyinSyllable {
  final String initial;
  final String vowel;
  final String tone;
  final String full;      // 如 "bā"
  final String number;    // 如 "ba1"

  const PinyinSyllable({
    required this.initial,
    required this.vowel,
    required this.tone,
    required this.full,
    required this.number,
  });
}

// ============== 拼音Quiz题目体系 ==============

enum PinyinQuizType {
  initials,      // 声母题：给声母，选择正确读音
  vowels,         // 韵母题：给韵母，选择正确读音
  tones,          // 声调题：给音节，选择声调
  syllables,      // 音节题：给汉字，选择拼音
  wholeRead,     // 整体认读：整体认读音节练习
}

class PinyinQuestion {
  final PinyinQuizType type;
  final String question;      // 题目内容
  final String answer;       // 正确答案
  final List<String> options; // 选项
  final String? hint;        // 提示

  const PinyinQuestion({
    required this.type,
    required this.question,
    required this.answer,
    required this.options,
    this.hint,
  });
}

// 拼音Quiz章节
class PinyinChapter {
  final int chapter;
  final String title;
  final String subtitle;
  final PinyinQuizType quizType;
  final List<PinyinQuestion> questions;

  const PinyinChapter({
    required this.chapter,
    required this.title,
    required this.subtitle,
    required this.quizType,
    required this.questions,
  });
}

// 拼音Quiz数据 - 声母练习
const pinyinInitialQuestions = [
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'b',
    answer: '玻',
    options: ['玻', '坡', '摸', '佛'],
    hint: '声母b，广播的波',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'p',
    answer: '坡',
    options: ['波', '坡', '摸', '佛'],
    hint: '声母p，坡道的坡',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'm',
    answer: '摸',
    options: ['波', '坡', '摸', '佛'],
    hint: '声母m，摸索的摸',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'f',
    answer: '佛',
    options: ['波', '坡', '摸', '佛'],
    hint: '声母f，佛像的佛',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'd',
    answer: '得',
    options: ['得', '特', '讷', '乐'],
    hint: '声母d，得到的得',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 't',
    answer: '特',
    options: ['得', '特', '讷', '乐'],
    hint: '声母t，特殊的特',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'n',
    answer: '讷',
    options: ['得', '特', '讷', '乐'],
    hint: '声母n，木讷的讷',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'l',
    answer: '乐',
    options: ['得', '特', '讷', '乐'],
    hint: '声母l，音乐的乐',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'g',
    answer: '哥',
    options: ['哥', '科', '喝', '喝'],
    hint: '声母g，哥哥的哥',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'k',
    answer: '科',
    options: ['哥', '科', '喝', '喝'],
    hint: '声母k科学的科',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'h',
    answer: '喝',
    options: ['哥', '科', '喝', '喝'],
    hint: '声母h，喝水的喝',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'j',
    answer: '基',
    options: ['基', '期', '西', '西'],
    hint: '声母j，基础的基',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'q',
    answer: '期',
    options: ['基', '期', '西', '期'],
    hint: '声母q，日期的期',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'x',
    answer: '西',
    options: ['基', '期', '西', '希'],
    hint: '声母x，西瓜的西',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'zh',
    answer: '知',
    options: ['知', '蚩', '诗', '日'],
    hint: '卷舌声母zh，知识的知',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'ch',
    answer: '蚩',
    options: ['知', '蚩', '诗', '日'],
    hint: '卷舌声母ch，蚩尤的蚩',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'sh',
    answer: '诗',
    options: ['知', '蚩', '诗', '日'],
    hint: '卷舌声母sh，诗歌的诗',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'r',
    answer: '日',
    options: ['知', '蚩', '诗', '日'],
    hint: '声母r，日本的日',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'z',
    answer: '资',
    options: ['资', '雌', '思', '思'],
    hint: '平舌声母z，资本的资',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'c',
    answer: '雌',
    options: ['资', '雌', '思', '词'],
    hint: '平舌声母c，雌性的雌',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 's',
    answer: '思',
    options: ['思', '词', '四', '寺'],
    hint: '平舌声母s，思念的思',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'y',
    answer: '医',
    options: ['医', '乌', '淤', '乌'],
    hint: '声母y，医院的医',
  ),
  PinyinQuestion(
    type: PinyinQuizType.initials,
    question: 'w',
    answer: '乌',
    options: ['医', '乌', '淤', '巫'],
    hint: '声母w，乌鸦的乌',
  ),
];

// 拼音Quiz数据 - 单韵母练习
const pinyinVowelQuestions = [
  PinyinQuestion(
    type: PinyinQuizType.vowels,
    question: 'a',
    answer: '啊',
    options: ['啊', '哦', '鹅', '衣'],
    hint: '单元音韵母a，啊的韵母',
  ),
  PinyinQuestion(
    type: PinyinQuizType.vowels,
    question: 'o',
    answer: '哦',
    options: ['啊', '哦', '哦', '鹅'],
    hint: '单元音韵母o，哦的韵母',
  ),
  PinyinQuestion(
    type: PinyinQuizType.vowels,
    question: 'e',
    answer: '鹅',
    options: ['鹅', '哦', '啊', '鹅'],
    hint: '单元音韵母e，饿鹅的鹅',
  ),
  PinyinQuestion(
    type: PinyinQuizType.vowels,
    question: 'i',
    answer: '衣',
    options: ['衣', '乌', '淤', '鱼'],
    hint: '单元音韵母i，衣服的衣',
  ),
  PinyinQuestion(
    type: PinyinQuizType.vowels,
    question: 'u',
    answer: '乌',
    options: ['乌', '衣', '淤', '屋'],
    hint: '单元音韵母u，乌鸦的乌',
  ),
  PinyinQuestion(
    type: PinyinQuizType.vowels,
    question: 'ü',
    answer: '淤',
    options: ['淤', '鱼', '淤', '雨'],
    hint: '单元音韵母ü，淤泥的淤',
  ),
];

// 拼音Quiz数据 - 声调练习
const pinyinToneQuestions = [
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'mā',
    answer: 'mā',
    options: ['mā', 'má', 'mǎ', 'mà'],
    hint: '第一声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'má',
    answer: 'má',
    options: ['mā', 'má', 'mǎ', 'mà'],
    hint: '第二声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'mǎ',
    answer: 'mǎ',
    options: ['mā', 'mǎ', 'mǎ', 'mà'],
    hint: '第三声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'mà',
    answer: 'mà',
    options: ['mà', 'mǎ', 'má', 'mà'],
    hint: '第四声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'bā',
    answer: 'bā',
    options: ['bā', 'bá', 'bǎ', 'bà'],
    hint: '第一声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'shū',
    answer: 'shū',
    options: ['shū', 'shú', 'shǔ', 'shù'],
    hint: '第一声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'yóu',
    answer: 'yóu',
    options: ['yōu', 'yóu', 'yǒu', 'yòu'],
    hint: '第二声',
  ),
  PinyinQuestion(
    type: PinyinQuizType.tones,
    question: 'hǎo',
    answer: 'hǎo',
    options: ['hāo', 'háo', 'hǎo', 'hào'],
    hint: '第三声',
  ),
];

// 拼音Quiz数据 - 整体认读音节
const pinyinWholeQuestions = [
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'zhi',
    answer: '知',
    options: ['知', '吃', '诗', '日'],
    hint: '整体认读音节zhi',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'chi',
    answer: '吃',
    options: ['知', '吃', '诗', '日'],
    hint: '整体认读音节chi',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'shi',
    answer: '诗',
    options: ['知', '吃', '诗', '日'],
    hint: '整体认读音节shi',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'ri',
    answer: '日',
    options: ['知', '吃', '诗', '日'],
    hint: '整体认读音节ri',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'zi',
    answer: '字',
    options: ['字', '词', '思', '四'],
    hint: '整体认读音节zi',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'ci',
    answer: '词',
    options: ['字', '词', '此', '次'],
    hint: '整体认读音节ci',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'si',
    answer: '思',
    options: ['思', '四', '死', '司'],
    hint: '整体认读音节si',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'yi',
    answer: '衣',
    options: ['衣', '一', '医', '伊'],
    hint: '整体认读音节yi',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'wu',
    answer: '乌',
    options: ['乌', '五', '无', '屋'],
    hint: '整体认读音节wu',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'yu',
    answer: '淤',
    options: ['淤', '鱼', '雨', '玉'],
    hint: '整体认读音节yu',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'ye',
    answer: '也',
    options: ['也', '夜', '叶', '业'],
    hint: '整体认读音节ye',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'yue',
    answer: '月',
    options: ['月', '约', '岳', '乐'],
    hint: '整体认读音节yue',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'yuan',
    answer: '元',
    options: ['元', '圆', '原', '园'],
    hint: '整体认读音节yuan',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'yin',
    answer: '音',
    options: ['音', '因', '银', '引'],
    hint: '整体认读音节yin',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'yun',
    answer: '云',
    options: ['云', '运', '晕', '允'],
    hint: '整体认读音节yun',
  ),
  PinyinQuestion(
    type: PinyinQuizType.wholeRead,
    question: 'ying',
    answer: '英',
    options: ['英', '应', '迎', '影'],
    hint: '整体认读音节ying',
  ),
];

// 拼音章节列表
const pinyinChapters = [
  PinyinChapter(
    chapter: 1,
    title: '声母练习',
    subtitle: '23个声母',
    quizType: PinyinQuizType.initials,
    questions: pinyinInitialQuestions,
  ),
  PinyinChapter(
    chapter: 2,
    title: '单韵母练习',
    subtitle: '6个单韵母',
    quizType: PinyinQuizType.vowels,
    questions: pinyinVowelQuestions,
  ),
  PinyinChapter(
    chapter: 3,
    title: '声调练习',
    subtitle: '四声+轻声',
    quizType: PinyinQuizType.tones,
    questions: pinyinToneQuestions,
  ),
  PinyinChapter(
    chapter: 4,
    title: '整体认读',
    subtitle: '16个整体认读音节',
    quizType: PinyinQuizType.wholeRead,
    questions: pinyinWholeQuestions,
  ),
];

// ============== 汉字学习体系 ==============

class ChineseChapter {
  final int chapter;
  final String title;
  final List<ChineseChar> characters;

  const ChineseChapter({
    required this.chapter,
    required this.title,
    required this.characters,
  });
}

class ChineseChar {
  final String character;
  final String pinyin;
  final String meaning;
  final String? radical;

  const ChineseChar({
    required this.character,
    required this.pinyin,
    required this.meaning,
    this.radical,
  });
}

const chineseChapters = [
  ChineseChapter(
    chapter: 1,
    title: '第一章：基础汉字',
    characters: [
      ChineseChar(character: '人', pinyin: 'rén', meaning: '人，人类'),
      ChineseChar(character: '大', pinyin: 'dà', meaning: '大小'),
      ChineseChar(character: '小', pinyin: 'xiǎo', meaning: '大小'),
      ChineseChar(character: '日', pinyin: 'rì', meaning: '太阳，日子'),
      ChineseChar(character: '月', pinyin: 'yuè', meaning: '月亮，月份'),
      ChineseChar(character: '水', pinyin: 'shuǐ', meaning: '水，河流'),
      ChineseChar(character: '火', pinyin: 'huǒ', meaning: '火，火焰'),
      ChineseChar(character: '山', pinyin: 'shān', meaning: '高山'),
    ],
  ),
  ChineseChapter(
    chapter: 2,
    title: '第二章：自然万物',
    characters: [
      ChineseChar(character: '木', pinyin: 'mù', meaning: '树木，木头'),
      ChineseChar(character: '土', pinyin: 'tǔ', meaning: '土地，泥土'),
      ChineseChar(character: '金', pinyin: 'jīn', meaning: '金子，金属'),
      ChineseChar(character: '风', pinyin: 'fēng', meaning: '大风，风'),
      ChineseChar(character: '雨', pinyin: 'yǔ', meaning: '下雨，雨'),
      ChineseChar(character: '云', pinyin: 'yún', meaning: '云朵，白云'),
      ChineseChar(character: '天', pinyin: 'tiān', meaning: '天空，上面'),
      ChineseChar(character: '地', pinyin: 'dì', meaning: '大地，地上'),
    ],
  ),
  ChineseChapter(
    chapter: 3,
    title: '第三章：数字与量词',
    characters: [
      ChineseChar(character: '一', pinyin: 'yī', meaning: '数字一'),
      ChineseChar(character: '二', pinyin: 'èr', meaning: '数字二'),
      ChineseChar(character: '三', pinyin: 'sān', meaning: '数字三'),
      ChineseChar(character: '四', pinyin: 'sì', meaning: '数字四'),
      ChineseChar(character: '五', pinyin: 'wǔ', meaning: '数字五'),
      ChineseChar(character: '六', pinyin: 'liù', meaning: '数字六'),
      ChineseChar(character: '七', pinyin: 'qī', meaning: '数字七'),
      ChineseChar(character: '八', pinyin: 'bā', meaning: '数字八'),
    ],
  ),
  ChineseChapter(
    chapter: 4,
    title: '第四章：动物象形',
    characters: [
      ChineseChar(character: '马', pinyin: 'mǎ', meaning: '马匹，骏马'),
      ChineseChar(character: '牛', pinyin: 'niú', meaning: '水牛，黄牛'),
      ChineseChar(character: '羊', pinyin: 'yáng', meaning: '山羊，绵羊'),
      ChineseChar(character: '鱼', pinyin: 'yú', meaning: '鱼类，金鱼'),
      ChineseChar(character: '鸟', pinyin: 'niǎo', meaning: '小鸟，飞鸟'),
      ChineseChar(character: '虫', pinyin: 'chóng', meaning: '虫子，昆虫'),
      ChineseChar(character: '犬', pinyin: 'quǎn', meaning: '狗，犬类'),
      ChineseChar(character: '龟', pinyin: 'guī', meaning: '乌龟，海龟'),
    ],
  ),
  ChineseChapter(
    chapter: 5,
    title: '第五章：人体与动作',
    characters: [
      ChineseChar(character: '手', pinyin: 'shǒu', meaning: '双手，手'),
      ChineseChar(character: '足', pinyin: 'zú', meaning: '脚，足部'),
      ChineseChar(character: '口', pinyin: 'kǒu', meaning: '嘴巴，人口'),
      ChineseChar(character: '目', pinyin: 'mù', meaning: '眼睛，目光'),
      ChineseChar(character: '耳', pinyin: 'ěr', meaning: '耳朵，听力'),
      ChineseChar(character: '走', pinyin: 'zǒu', meaning: '行走，走路'),
      ChineseChar(character: '跑', pinyin: 'pǎo', meaning: '跑步，奔跑'),
      ChineseChar(character: '立', pinyin: 'lì', meaning: '站立，树立'),
    ],
  ),
  ChineseChapter(
    chapter: 6,
    title: '第六章：声母学习',
    characters: [
      ChineseChar(character: '波', pinyin: 'bō', meaning: '波浪，广播'),
      ChineseChar(character: '坡', pinyin: 'pō', meaning: '山坡，斜坡'),
      ChineseChar(character: '摸', pinyin: 'mō', meaning: '摸索，触摸'),
      ChineseChar(character: '佛', pinyin: 'fó', meaning: '佛像，神佛'),
    ],
  ),
  ChineseChapter(
    chapter: 7,
    title: '第七章：单韵母学习',
    characters: [
      ChineseChar(character: '啊', pinyin: 'ā', meaning: '感叹词'),
      ChineseChar(character: '哦', pinyin: 'ó', meaning: '感叹词'),
      ChineseChar(character: '鹅', pinyin: 'é', meaning: '白鹅，鸟类'),
      ChineseChar(character: '衣', pinyin: 'yī', meaning: '衣服，上衣'),
    ],
  ),
  ChineseChapter(
    chapter: 8,
    title: '第八章：整体认读音节',
    characters: [
      ChineseChar(character: '知', pinyin: 'zhī', meaning: '知道，知识'),
      ChineseChar(character: '吃', pinyin: 'chī', meaning: '吃饭，吃东西'),
      ChineseChar(character: '诗', pinyin: 'shī', meaning: '诗歌，诗人'),
      ChineseChar(character: '日', pinyin: 'rì', meaning: '日子，太阳'),
    ],
  ),
];
