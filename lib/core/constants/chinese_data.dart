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
];
