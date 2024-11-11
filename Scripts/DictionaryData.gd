extends Node2D

var Coins = 0
var ColorDict = 1
var GameDict
var TextCheck = 1
var ProgressBarValue1 = 0
var ProgressBarValue2 = 0
var ProgressBarValue3 = 0
var ProgressBarValue4 = 0
var RomajiOption = true
var FuriganaMode = true
var FirstTimeKanjiCheck = false

#var HiraCheck1: bool
#var HiraCheck2: bool
#var HiraCheck3: bool
#var HiraCheck4: bool
#var HiraCheck5: bool
#var HiraCheck6: bool
#var HiraCheck7: bool
#var HiraCheck8: bool
#var HiraCheck9: bool
#var HiraCheck10: bool
#
#var KataCheck1: bool
#var KataCheck2: bool
#var KataCheck3: bool
#var KataCheck4: bool
#var KataCheck5: bool
#var KataCheck6: bool
#var KataCheck7: bool
#var KataCheck8: bool
#var KataCheck9: bool
#var KataCheck10: bool
#
#var KanjiCheck1 : bool
#var KanjiCheck2 : bool
#var KanjiCheck3 : bool
#var KanjiCheck4 : bool
#var KanjiCheck5 : bool
#var KanjiCheck6 : bool
#var KanjiCheck7 : bool
#var KanjiCheck8 : bool
#var KanjiCheck9 : bool
#var KanjiCheck10 : bool
#
#var VocabCheck1 : bool
#var VocabCheck2 : bool
#var VocabCheck3 : bool
#var VocabCheck4 : bool
#var VocabCheck5 : bool
#var VocabCheck6 : bool
#var VocabCheck7 : bool
#var VocabCheck8 : bool
#var VocabCheck9 : bool
#var VocabCheck10 : bool

var options_check1 = true

var hira_aiueo = [
	{
		"question": ["あ"],
		"answer": ["a"]
	},
	{
		"question": ["い"],
		"answer" : ["i"]
	},
	{
		"question": ["う"],
		"answer": ["u"]
	},
	{
		"question": ["え"],
		"answer": ["e"]
	},
	{
		"question": ["お"],
		"answer": ["o"]
	}]
var hira_kakikukeko = [
	{
		"question" : ["か"],
		"answer" : ["ka"],
	},
	{
		"question" : ["き"],
		"answer" : ["ki"]
	},
	{
		"question" : ["く"],
		"answer" : ["ku"]
	},
	{
		"question" : ["け"],
		"answer" : ["ke"]
	},
	{
		"question" : ["こ"],
		"answer" : ["ko"]
	}]
var hira_sashisuseso = [
	{
		"question" : ["さ"],
		"answer" : ["sa"]
	},
	{
		"question" : ["し"],
		"answer" : ["shi"]
	},
	{
		"question" : ["す"],
		"answer" : ["su"]
	},
	{
		"question" : ["せ"],
		"answer" : ["se"]
	},
	{
		"question" : ["そ"],
		"answer" : ["so"]
	}]
var hira_tachitsuteto = [
	{
		"question" : ["た"],
		"answer" : ["ta"]
	},
	{
		"question" : ["ち"],
		"answer" : ["chi"]
	},
	{
		"question" : ["つ"],
		"answer" : ["tsu"]
	},
	{
		"question" : ["て"],
		"answer" : ["te"]
	},
	{
		"question" : ["と"],
		"answer" : ["to"]
	}
	]
var hira_naninuneno = [
	{
		"question" : ["な"],
		"answer" : ["na"]
	},
	{
		"question" : ["に"],
		"answer" : ["ni"]
	},
	{
		"question" : ["ぬ"],
		"answer" : ["nu"]
	},
	{
		"question" : ["ね"],
		"answer" : ["ne"]
	},
	{
		"question" : ["の"],
		"answer" : ["no"]
	}
	]
var hira_hahifuheho = [
	{
		"question" : ["は"],
		"answer" : ["ha"]
	},
	{
		"question" : ["ひ"],
		"answer" : ["hi"]
	},
	{
		"question" : ["ふ"],
		"answer" : ["fu"]
	},
	{
		"question" : ["へ"],
		"answer" : ["he"]
	},
	{
		"question" : ["ほ"],
		"answer" : ["ho"]
	}]
var hira_mamimumemo = [
	{
		"question" : ["ま"],
		"answer" : ["ma"]
	},
	{
		"question" : ["み"],
		"answer" : ["mi"]
	},
	{
		"question" : ["む"],
		"answer" : ["mu"]
	},
	{
		"question" : ["め"],
		"answer" : ["me"]
	},
	{
		"question" : ["も"],
		"answer" : ["mo"]
	}]
var hira_yayuyo = [
	{
		"question" : ["や"],
		"answer" : ["ya"]
	},
	{
		"question" : ["ゆ"],
		"answer" : ["yu"]
	},
	{
		"question" : ["よ"],
		"answer" : ["yo"]
	}]
var hira_rarirurero = [
	{
		"question" : ["ら"],
		"answer" : ["ra"]
	},
	{
		"question" : ["り"],
		"answer" : ["ri"]
	},
	{
		"question" : ["る"],
		"answer" : ["ru"]
	},
	{
		"question" : ["れ"],
		"answer" : ["re"]
	},
	{
		"question" : ["ろ"],
		"answer" : ["ro"]
	}]
var hira_wanwo = [
	{
		"question" : ["わ"],
		"answer" : ["wa"]
	},
	{
		"question" : ["ん"],
		"answer" : ["n"]
	},
	{
		"question" : ["を"],
		"answer" : ["wo"]
	}]

var kata_aiueo = [
	{
		"question": ["ア"],
		"answer": ["a"]
	},
	{
		"question": ["イ"],
		"answer" : ["i"]
	},
	{
		"question": ["ウ"],
		"answer": ["u"]
	},
	{
		"question": ["エ"],
		"answer": ["e"]
	},
	{
		"question": ["オ"],
		"answer": ["o"]
	}]
var kata_kakikukeko = [
	{
		"question" : ["カ"],
		"answer" : ["ka"],
	},
	{
		"question" : ["キ"],
		"answer" : ["ki"]
	},
	{
		"question" : ["ク"],
		"answer" : ["ku"]
	},
	{
		"question" : ["ケ"],
		"answer" : ["ke"]
	},
	{
		"question" : ["コ"],
		"answer" : ["ko"]
	}]
var kata_sashisuseso = [
	{
		"question" : ["サ"],
		"answer" : ["sa"]
	},
	{
		"question" : ["シ"],
		"answer" : ["shi"]
	},
	{
		"question" : ["ス"],
		"answer" : ["su"]
	},
	{
		"question" : ["セ"],
		"answer" : ["se"]
	},
	{
		"question" : ["ソ"],
		"answer" : ["so"]
	}]
var kata_tachitsuteto = [
	{
		"question" : ["タ"],
		"answer" : ["ta"]
	},
	{
		"question" : ["チ"],
		"answer" : ["chi"]
	},
	{
		"question" : ["ツ"],
		"answer" : ["tsu"]
	},
	{
		"question" : ["テ"],
		"answer" : ["te"]
	},
	{
		"question" : ["ト"],
		"answer" : ["to"]
	}
	]
var kata_naninuneno = [
	{
		"question" : ["ナ"],
		"answer" : ["na"]
	},
	{
		"question" : ["二"],
		"answer" : ["ni"]
	},
	{
		"question" : ["ヌ"],
		"answer" : ["nu"]
	},
	{
		"question" : ["ネ"],
		"answer" : ["ne"]
	},
	{
		"question" : ["ノ"],
		"answer" : ["no"]
	}
	]
var kata_hahifuheho = [
	{
		"question" : ["ハ"],
		"answer" : ["ha"]
	},
	{
		"question" : ["ヒ"],
		"answer" : ["hi"]
	},
	{
		"question" : ["フ"],
		"answer" : ["fu"]
	},
	{
		"question" : ["ヘ"],
		"answer" : ["he"]
	},
	{
		"question" : ["ホ"],
		"answer" : ["ho"]
	}]
var kata_mamimumemo = [
	{
		"question" : ["マ"],
		"answer" : ["ma"]
	},
	{
		"question" : ["ミ"],
		"answer" : ["mi"]
	},
	{
		"question" : ["ム"],
		"answer" : ["mu"]
	},
	{
		"question" : ["メ"],
		"answer" : ["me"]
	},
	{
		"question" : ["モ"],
		"answer" : ["mo"]
	}]
var kata_yayuyo = [
	{
		"question" : ["ヤ"],
		"answer" : ["ya"]
	},
	{
		"question" : ["ユ"],
		"answer" : ["yu"]
	},
	{
		"question" : ["ヨ"],
		"answer" : ["yo"]
	}]
var kata_rarirurero = [
	{
		"question" : ["ラ"],
		"answer" : ["ra"]
	},
	{
		"question" : ["リ"],
		"answer" : ["ri"]
	},
	{
		"question" : ["ル"],
		"answer" : ["ru"]
	},
	{
		"question" : ["レ"],
		"answer" : ["re"]
	},
	{
		"question" : ["ロ"],
		"answer" : ["ro"]
	}]
var kata_wanwo = [
	{
		"question" : ["ワ"],
		"answer" : ["wa"]
	},
	{
		"question" : ["ン"],
		"answer" : ["n"]
	},
	{
		"question" : ["ヲ"],
		"answer" : ["wo"]
	}]

var test = [
	{
		"question": "会う",
		"pronoun": "あう",
		"romaji": "au",
		"translation": "to meet",
		"translation2": "to see"
	},
	{
		"question": "青い",
		"pronoun": "あおい",
		"romaji": "aoi",
		"translation": "blue"
	},
	{
		"question": "出口",
		"pronoun": "でぐち",
		"romaji": "deguchi",
		"translation": "exit"
	},
	{
		"question": "千",
		"pronoun": "せん",
		"romaji": "sen",
		"translation": "thousand"
	},
	{
		"question": "口",
		"pronoun": "くち",
		"romaji": "kuchi",
		"translation": "mouth"
	},
	{
		"question": "耳",
		"pronoun": "みみ",
		"romaji": "mimi",
		"translation": "ear"
	},
	{
		"question": "人",
		"pronoun": "ひと",
		"romaji": "hito",
		"translation": "person"
	},
	{
		"question": "電車",
		"pronoun": "でんしゃ",
		"romaji": "densha",
		"translation": "train"
	},
	{
		"question": "百",
		"pronoun": "ひゃく",
		"romaji": "hyaku",
		"translation": "hundred"
	},
	{
		"question": "入口",
		"pronoun": "いりぐち",
		"romaji": "iriguchi",
		"translation": "entrance"
	},
	{
		"question": "会社",
		"pronoun": "かいしゃ",
		"romaji": "kaisha",
		"translation": "company"
	},
	{
		"question": "目",
		"pronoun": "め",
		"romaji": "me",
		"translation": "eye"
	},
	{
		"question": "車",
		"pronoun": "くるま",
		"romaji": "kuruma",
		"translation": "car"
	},
	{
		"question": "学校",
		"pronoun": "がっこう",
		"romaji": "gakkou",
		"translation": "school"
	},
	{
		"question": "店",
		"pronoun": "みせ",
		"romaji": "mise",
		"translation": "shop"
	},
	{
		"question": "足",
		"pronoun": "あし",
		"romaji": "ashi",
		"translation": "foot"
	},
	{
		"question": "大学",
		"pronoun": "だいがく",
		"romaji": "daigaku",
		"translation": "university"
	},
	{
		"question": "万",
		"pronoun": "まん",
		"romaji": "man",
		"translation": "ten thousand"
	},
	{
		"question": "手",
		"pronoun": "て",
		"romaji": "te",
		"translation": "hand"
	},
	{
		"question": "駅",
		"pronoun": "えき",
		"romaji": "eki",
		"translation": "station"
	},
	{
		"question": "今日",
		"pronoun": "きょう",
		"romaji": "kyou",
		"translation": "today",
		"translation2": "this day"
	},
	{
		"question": "赤い",
		"pronoun": "あかい",
		"romaji": "akai",
		"translation": "red"
	},
	{
		"question": "明るい",
		"pronoun": "あかるい",
		"romaji": "akarui",
		"translation": "bright",
		"translation2": "cheerful"
	},
	{
		"question": "秋",
		"pronoun": "あき",
		"romaji": "aki",
		"translation": "autumn",
		"translation2": "fall"
	},
	{
		"question": "朝",
		"pronoun": "あさ",
		"romaji": "asa",
		"translation": "morning"
	},
	{
		"question": "朝ごはん",
		"pronoun": "あさごはｎ",
		"romaji": "asagohan",
		"translation": "breakfast"
	},
	{
		"question": "明日",
		"pronoun": "あした",
		"romaji": "ashita",
		"translation": "tomorrow"
	},
	{
		"question": "あそこ",
		"pronoun": "",
		"romaji": "asoko",
		"translation": "over there"
	},
	{
		"question": "遊ぶ",
		"pronoun": "あそぶ",
		"romaji": "asobu",
		"translation": "to play"
	},
	{
		"question": "来週",
		"pronoun": "らいしゅう",
		"romaji": "raishuu",
		"translation": "next week"
	},
	{
		"question": "頭",
		"pronoun": "あたま",
		"romaji": "atama",
		"translation": "head"
	},
	{
		"question": "南",
		"pronoun": "みなみ",
		"romaji": "minami",
		"translation": "south"
	},
	{
		"question": "毎日",
		"pronoun": "まいにち",
		"romaji": "mainichi",
		"translation": "everyday"
	},
	{
		"question": "午前",
		"pronoun": "ごぜん",
		"romaji": "gozen",
		"translation": "AM"
	},
	{
		"question": "前",
		"pronoun": "まえ",
		"romaji": "mae",
		"translation": "front"
	},
	{
		"question": "今週",
		"pronoun": "こんしゅう",
		"romaji": "konshuu",
		"translation": "this week"
	},
	{
		"question": "下",
		"pronoun": "した",
		"romaji": "shita",
		"translation": "under"
	},
	{
		"question": "外",
		"pronoun": "そと",
		"romaji": "soto",
		"translation": "outside"
	},
	{
		"question": "時間",
		"pronoun": "じかん",
		"romaji": "jikan",
		"translation": "time"
	},
	{
		"question": "一週間",
		"pronoun": "いっしゅうかん",
		"romaji": "isshuukan",
		"translation": "one week"
	},
	{
		"question": "西",
		"pronoun": "にし",
		"romaji": "nishi",
		"translation": "west"
	},
	{
		"question": "午後",
		"pronoun": "ごご",
		"romaji": "gogo",
		"translation": "PM"
	},
	{
		"question": "来月",
		"pronoun": "らいげつ",
		"romaji": "raigetsu",
		"translation": "next month"
	},
	]
var N5 = [
	{
		"question": "口",
		"pronoun": "くち",
		"romaji": "kuchi",
		"translation": ["mouth"]
	},
	{
		"question": "目",
		"pronoun": "め",
		"romaji": "me",
		"translation": ["eye"]
	},
	{
		"question": "日",
		"pronoun": "ひ",
		"romaji": "hi",
		"translation":["day","sun"]
	},
	{
		"question": "白い",
		"pronoun": "しろい",
		"romaji": "shiroi",
		"translation": ["white"]
	},
	{
		"question": "百",
		"pronoun": "ひゃく",
		"romaji": "hyaku",
		"translation": ["hundred"]
	},
	{
		"question": "千",
		"pronoun": "せん",
		"romaji": "sen",
		"translation": ["thousand"]
	},
	{
		"question": "万",
		"pronoun": "まん",
		"romaji": "man",
		"translation": ["ten thousand"]
	},
	{
		"question": "人",
		"pronoun": "ひと",
		"romaji": "hito",
		"translation": ["person","man"]
	},
	{
		"question": "分",
		"pronoun": "ふん",
		"romaji": "fun",
		"translation": ["minute"]
	},
	{
		"question": "土",
		"pronoun": "つち",
		"romaji": "tsuchi",
		"translation": ["soil","earth"]
	},
	{
		"question": "時",
		"pronoun": "とき",
		"romaji": "toki",
		"translation": ["time","hour"]
	},
	{
		"question": "週",
		"pronoun": "しゅう",
		"romaji": "shuu",
		"translation": ["week"]
	},
	{
		"question": "月",
		"pronoun": "つき",
		"romaji": "tsuki",
		"translation": ["moon","month"]
	},
	{
		"question": "午後",
		"pronoun": "ごご",
		"romaji": "gogo",
		"translation": ["PM"]
	},
	{
		"question": "午前",
		"pronoun": "ごぜん",
		"romaji": "gozen",
		"translation": ["AM"]
	},
	{
		"question": "年",
		"pronoun": "とし",
		"romaji": "toshi",
		"translation": ["year"]
	},
	{
		"question": "今",
		"pronoun": "いま",
		"romaji": "ima",
		"translation": ["now"]
	},
	{
		"question": "木",
		"pronoun": "き",
		"romaji": "ki",
		"translation": ["tree","shrub"]
	},
	{
		"question": "田",
		"pronoun": "た",
		"romaji": "ta",
		"translation": ["rice field"]
	},
	{
		"question": "力",
		"pronoun": "ちから",
		"romaji": "chikara",
		"translation": ["strength","power"]
	},
	{
		"question": "前",
		"pronoun": "まえ",
		"romaji": "mae",
		"translation": ["in front of","before"]
	},
	{
		"question": "後",
		"pronoun": "あと",
		"romaji": "ato",
		"translation": ["after","behind"]
	},
	{
		"question": "先",
		"pronoun": "さき",
		"romaji": "saki",
		"translation": ["preceding","former"]
	},
	{
		"question": "来る",
		"pronoun": "くる",
		"romaji": "kuru",
		"translation": ["to come"]
	},
	{
		"question": "男",
		"pronoun": "おとこ",
		"romaji": "otoko",
		"translation": ["man","male"]
	},
	{
		"question": "女",
		"pronoun": "おんな",
		"romaji": "onna",
		"translation": ["woman","female"]
	},
	{
		"question": "子",
		"pronoun": "こ",
		"romaji": "ko",
		"translation": ["child"]
	},
	{
		"question": "父",
		"pronoun": "ちち",
		"romaji": "chichi",
		"translation": ["father"]
	},
	{
		"question": "お父さん",
		"pronoun": "おとうさん",
		"romaji": "otousan",
		"translation": ["father"]
	},
	{
		"question": "火",
		"pronoun": "ひ",
		"romaji": "hi",
		"translation": ["fire"]
	},
	{
		"question": "水",
		"pronoun": "みず",
		"romaji": "mizu",
		"translation": ["water"]
	},
	{
		"question": "お金",
		"pronoun": "おかね",
		"romaji": "okane",
		"translation": ["money"]
	},
	{
		"question": "本",
		"pronoun": "ほん",
		"romaji": "hon",
		"translation": ["book"]
	},
	{
		"question": "川",
		"pronoun": "かわ",
		"romaji": "kawa",
		"translation": ["river"]
	},
	{
		"question": "山",
		"pronoun": "やま",
		"romaji": "yama",
		"translation": ["mountain"]
	},
	{
		"question": "雨",
		"pronoun": "あめ",
		"romaji": "ame",
		"translation": ["rain"]
	},
	{
		"question": "花",
		"pronoun": "はな",
		"romaji": "hana",
		"translation": ["flower"]
	},
	{
		"question": "耳",
		"pronoun": "みみ",
		"romaji": "mimi",
		"translation": ["ear"]
	},
	{
		"question": "手",
		"pronoun": "て",
		"romaji": "te",
		"translation": ["hand"]
	},
	{
		"question": "足",
		"pronoun": "あし",
		"romaji": "ashi",
		"translation": ["foot"]
	},
	{
		"question": "目",
		"pronoun": "め",
		"romaji": "me",
		"translation": ["eye"]
	},
	{
		"question": "北",
		"pronoun": "きた",
		"romaji": "kita",
		"translation": ["north"]
	},
	{
		"question": "南",
		"pronoun": "みなみ",
		"romaji": "minami",
		"translation": ["south"]
	},
	{
		"question": "東",
		"pronoun": "ひがし",
		"romaji": "higashi",
		"translation": ["east"]
	},
	{
		"question": "西",
		"pronoun": "にし",
		"romaji": "nishi",
		"translation": ["west"]
	},
	{
		"question": "上",
		"pronoun": "うえ",
		"romaji": "ue",
		"translation": ["over","above"]
	},
	{
		"question": "下",
		"pronoun": "した",
		"romaji": "shita",
		"translation": ["under","below"]
	},
	{
		"question": "中",
		"pronoun": "なか",
		"romaji": "naka",
		"translation": ["inside"]
	},
	{
		"question": "右",
		"pronoun": "みぎ",
		"romaji": "migi",
		"translation": ["right hand side"]
	},
	{
		"question": "私",
		"pronoun": "わたし",
		"romaji": "watashi",
		"translation": ["i","me"]
	},
	{
		"question": "半",
		"pronoun": "はん",
		"romaji": "han",
		"translation": ["half","half-past"]
	},
	{
		"question": "母",
		"pronoun": "はは",
		"romaji": "haha",
		"translation": ["mother"]
	},
	{
		"question": "お母さん",
		"pronoun": "おかあさん",
		"romaji": "okaasan",
		"translation": ["mother"]
	},
	{
		"question": "毎日",
		"pronoun": "まいにち",
		"romaji": "mainichi",
		"translation": ["every day"]
	},
	{
		"question": "毎",
		"pronoun": "まい",
		"romaji": "mai",
		"translation": ["every","each"]
	},
	{
		"question": "何",
		"pronoun": "なん",
		"romaji": "nan",
		"translation": ["what"]
	},
	{
		"question": "友",
		"pronoun": "とも",
		"romaji": "tomo",
		"translation": ["friend"]
	},
	{
		"question": "友達",
		"pronoun": "ともだち",
		"romaji": "tomodachi",
		"translation": ["friend"]
	},
	{
		"question": "気",
		"pronoun": "き",
		"romaji": "ki",
		"translation": ["spirit","heart"]
	},
	{
		"question": "生まれる",
		"pronoun": "うまれる",
		"romaji": "umareru",
		"translation": ["to be born"]
	},
	{
		"question": "生まれ",
		"pronoun": "うまれ",
		"romaji": "umare",
		"translation": ["birthplace","born in"]
	},
	{
		"question": "魚",
		"pronoun": "さかな",
		"romaji": "sakana",
		"translation": ["fish"]
	},
	{
		"question": "大きい",
		"pronoun": "おおきい",
		"romaji": "ookii",
		"translation": ["big"]
	},
	{
		"question": "天",
		"pronoun": "てん",
		"romaji": "ten",
		"translation": ["heaven"]
	},
	{
		"question": "空",
		"pronoun": "そら",
		"romaji": "sora",
		"translation": ["the air","sky"]
	},
	{
		"question": "電",
		"pronoun": "でん",
		"romaji": "den",
		"translation": ["electric"]
	},
	{
		"question": "車",
		"pronoun": "くるま",
		"romaji": "kuruma",
		"translation": ["car","vehicle"]
	},
	{
		"question": "言う",
		"pronoun": "いう",
		"romaji": "iu",
		"translation": ["to say"]
	},
	{
		"question": "語",
		"pronoun": "ご",
		"romaji": "go",
		"translation": ["language"]
	},
	{
		"question": "名",
		"pronoun": "な",
		"romaji": "na",
		"translation": ["title","name"]
	},
	{
		"question": "お名前",
		"pronoun": "おなまえ",
		"romaji": "onamae",
		"translation": ["name"]
	},
	{
		"question": "店",
		"pronoun": "みせ",
		"romaji": "mise",
		"translation": ["shop","store"]
	},
	{
		"question": "馬",
		"pronoun": "うま",
		"romaji": "uma",
		"translation": ["horse"]
	},
	{
		"question": "駅",
		"pronoun": "えき",
		"romaji": "eki",
		"translation": ["station"]
	},
	{
		"question": "道",
		"pronoun": "みち",
		"romaji": "michi",
		"translation": ["road","route"]
	},
	{
		"question": "社",
		"pronoun": "しゃ",
		"romaji": "sha",
		"translation": ["company"]
	},
	{
		"question": "国",
		"pronoun": "くに",
		"romaji": "kuni",
		"translation": ["country"]
	},
	{
		"question": "外",
		"pronoun": "そと",
		"romaji": "soto",
		"translation": ["outside"]
	},
	{
		"question": "学",
		"pronoun": "がく",
		"romaji": "gaku",
		"translation": ["knowledge","study"]
	},
	{
		"question": "学校",
		"pronoun": "がっこう",
		"romaji": "gakkou",
		"translation": ["school"]
	},
	{
		"question": "入る",
		"pronoun": "はいる",
		"romaji": "hairu",
		"translation": ["to enter","to get into"]
	},
	{
		"question": "見る",
		"pronoun": "みる",
		"romaji": "miru",
		"translation": ["to see","to watch"]
	},
	{
		"question": "門",
		"pronoun": "もん",
		"romaji": "mon",
		"translation": ["gate"]
	},
	{
		"question": "間",
		"pronoun": "あいだ",
		"romaji": "aida",
		"translation": ["between"]
	},
	{
		"question": "この間",
		"pronoun": "このあいだ",
		"romaji": "konoaida",
		"translation": ["recently","the other day"]
	},
	{
		"question": "聞く",
		"pronoun": "きく",
		"romaji": "kiku",
		"translation": ["to listen","to hear","to ask"]
	},
	{
		"question": "聞こえる",
		"pronoun": "きこえる",
		"romaji": "kikoeru",
		"translation": ["to be audible"]
	},
	{
		"question": "書く",
		"pronoun": "かく",
		"romaji": "kaku",
		"translation": ["to write"]
	},
	{
		"question": "読む",
		"pronoun": "よむ",
		"romaji": "yomu",
		"translation": ["to read"]
	},
	{
		"question": "舌",
		"pronoun": "した",
		"romaji": "shita",
		"translation": ["tongue"]
	},
	{
		"question": "話す",
		"pronoun": "はなす",
		"romaji": "hanasu",
		"translation": ["to speak"]
	},
	{
		"question": "買う",
		"pronoun": "かう",
		"romaji": "kau",
		"translation": ["to buy"]
	},
	{
		"question": "行く",
		"pronoun": "いく",
		"romaji": "iku",
		"translation": ["to go"]
	},
	{
		"question": "行き",
		"pronoun": "いき",
		"romaji": "iki",
		"translation": ["bound for"]
	},
	{
		"question": "出る",
		"pronoun": "でる",
		"romaji": "deru",
		"translation": ["to leave","to go out"]
	},
	{
		"question": "出かける",
		"pronoun": "でかける",
		"romaji": "dekakeru",
		"translation": ["to go out on an outing"]
	},
	{
		"question": "休み",
		"pronoun": "やすみ",
		"romaji": "yasumi",
		"translation": ["rest","vacation","holiday"]
	},
	{
		"question": "休む",
		"pronoun": "やすむ",
		"romaji": "yasumu",
		"translation": ["to rest","take a day off"]
	},
	{
		"question": "食べる",
		"pronoun": "たべる",
		"romaji": "taberu",
		"translation": ["to eat"]
	},
	{
		"question": "飲む",
		"pronoun": "のむ",
		"romaji": "nomu",
		"translation": ["to drink"]
	},
	{
		"question": "立つ",
		"pronoun": "たつ",
		"romaji": "tatsu",
		"translation": ["to stand"]
	},
	{
		"question": "立てる",
		"pronoun": "たてる",
		"romaji": "tateru",
		"translation": ["to stand something up"]
	},
	{
		"question": "会う",
		"pronoun": "あう",
		"romaji": "au",
		"translation": ["to meet"]
	},
	{
		"question": "多い",
		"pronoun": "おおい",
		"romaji": "ooi",
		"translation": ["a lot","many"]
	},
	{
		"question": "多め",
		"pronoun": "おおめ",
		"romaji": "oome",
		"translation": ["larger quantity"]
	},
	{
		"question": "小さい",
		"pronoun": "ちいさい",
		"romaji": "chiisai",
		"translation": ["small"]
	},
	{
		"question": "小さな",
		"pronoun": "ちいさな",
		"romaji": "chiisana",
		"translation": ["small","little"]
	},
	{
		"question": "小さめ",
		"pronoun": "ちいさめ",
		"romaji": "chiisame",
		"translation": ["on the small side"]
	},
	{
		"question": "少し",
		"pronoun": "すこし",
		"romaji": "sukoshi",
		"translation": ["little","few"]
	},
	{
		"question": "少ない",
		"pronoun": "すくない",
		"romaji": "sukunai",
		"translation": ["few","insufficient"]
	},
	{
		"question": "少なめ",
		"pronoun": "すくなめ",
		"romaji": "sukuname",
		"translation": ["smaller quantity","slightly below"]
	},
	{
		"question": "古い",
		"pronoun": "ふるい",
		"romaji": "furui",
		"translation": ["old thing"]
	},
	{
		"question": "辛い",
		"pronoun": "からい",
		"romaji": "karai",
		"translation": ["spicy"]
	},
	{
		"question": "新しい",
		"pronoun": "あたらしい",
		"romaji": "atarashii",
		"translation": ["new"]
	},
	{
		"question": "安い",
		"pronoun": "やすい",
		"romaji": "yasui",
		"translation": ["inexpensive"]
	},
	{
		"question": "高い",
		"pronoun": "たかい",
		"romaji": "takai",
		"translation": ["tall","expensive"]
	},
	{
		"question": "長い",
		"pronoun": "ながい",
		"romaji": "nagai",
		"translation": ["long distance"]
	},
	{
		"question": "円",
		"pronoun": "えん",
		"romaji": "en",
		"translation": ["japanese monetary unit"]
	}#,
	#{
	#	"question": "",
	#	"pronoun": "",
	#	"romaji": "",
	#	"translation": ""
	#}
	]

var NOZW = [
	{
		"question":["北"],
		"pronoun": ["きた"],
		"romaji": ["kita"],
		"translation": ["north"]
	},
	{
		"question": ["南"],
		"pronoun": ["みなみ"],
		"romaji": ["minami"],
		"translation" : ["south"]
	},
	{
		"question": ["東"],
		"pronoun": ["ひがし"],
		"romaji": ["higashi"],
		"translation" : ["east"]
	},
	{
		"question": ["西"],
		"pronoun": ["にし"],
		"romaji": ["nishi"],
		"translation" : ["west"]
	}]
var weekdays = [
	{
		"question": ["来週"],
		"pronoun": ["らいしゅう"],
		"romaji": ["raishuu"],
		"translation" : ["next week"]
	},
	{
		"question": ["今週"],
		"pronoun": ["こんしゅう"],
		"romaji": ["konshuu"],
		"translation" : ["this week"]
	},
	{
		"question": ["先週"],
		"pronoun": ["せんしゅう"],
		"romaji": ["senshuu"],
		"translation" : ["last week"]
	},
	{
		"question":["毎週"],
		"pronoun": ["まいしゅう"],
		"romaji": ["maishuu"],
		"translation" :["every week"]
	},
	{
		"question": ["一週間"],
		"pronoun": ["いっしゅうかん"],
		"romaji": ["isshuukan"],
		"translation" : ["one week"]
	},
	{
		"question": ["来月"],
		"pronoun": ["らいげつ"],
		"romaji": ["raigetsu"],
		"translation" : ["next month"]
	},
	{
		"question": ["今月"],
		"pronoun": ["こんげつ"],
		"romaji": ["kongetsu"],
		"translation" : ["this month"]
	},
	{
		"question": ["先月"],
		"pronoun": ["せんげつ"],
		"romaji": ["sengetsu"],
		"translation" : ["last month"]
	},
	{
		"question": ["毎月"],
		"pronoun": ["まいつき"],
		"romaji": ["maitsuki"],
		"translation" : ["every month"]
	},
	{
		"question": ["来年"],
		"pronoun": ["らいねん"],
		"romaji": ["rainen"],
		"translation" : ["next year"]
	},
	{
		"question": ["今年"],
		"pronoun": ["ことし"],
		"romaji": ["kotoshi"],
		"translation" : ["this year"]
	},
	{
		"question": ["毎日"],
		"pronoun": ["まいにち"],
		"romaji": ["mainichi"],
		"translation" : ["every day"]
	},
	{
		"question": ["毎"],
		"pronoun": ["まい"],
		"romaji": ["mai"],
		"translation" : ["every"]
	},
	{
		"question": ["来"],
		"pronoun": ["らい"],
		"romaji": ["rai"],
		"translation" : ["next"]
	},
	{
		"question": ["先"],
		"pronoun": ["せん"],
		"romaji": ["sen"],
		"translation" : ["last"]
	},
	{
		"question": ["今"],
		"pronoun": ["いま"],
		"romaji": ["ima"],
		"translation" : ["this"]
	}]
var numbers = [
	{
		"question": ["一"],
		"pronoun": ["いち"],
		"romaji": ["ichi"],
		"translation": ["one"]
	},
	{
		"question": ["二"],
		"pronoun": ["に"],
		"romaji": ["ni"],
		"translation": ["two"]
	},
	{
		"question": ["三"],
		"pronoun": ["さん"],
		"romaji": ["san"],
		"translation": ["three"]
	},
	{
		"question": ["四"],
		"pronoun": ["よん / し"],
		"romaji": ["yon","shi"],
		"translation": ["four"]
	},
	{
		"question": ["五"],
		"pronoun": ["ご"],
		"romaji": ["go"],
		"translation": ["five"]
	},
	{
		"question": ["六"],
		"pronoun": ["ろく"],
		"romaji": ["roku"],
		"translation": ["six"]
	},
	{
		"question": ["七"],
		"pronoun": ["なな / しち"],
		"romaji": ["nana","shichi"],
		"translation":["seven"]
	},
	{
		"question": ["八"],
		"pronoun": ["はち"],
		"romaji": ["hachi"],
		"translation": ["eight"]
	},
	{
		"question": ["九"],
		"pronoun": ["きゅう / く"],
		"romaji": ["kyuu","ku"],
		"translation": ["nine"]
	},
	{
		"question": ["十"],
		"pronoun": ["じゅう"],
		"romaji": ["juu"],
		"translation": ["ten"]
	},
	{
		"question": ["千"],
		"pronoun": ["せん"],
		"romaji": ["sen"],
		"translation": ["thousand"]
	},
	{
		"question": ["百"],
		"pronoun": ["ひゃく"],
		"romaji" : ["hyaku"],
		"translation": ["hundred"]
	},
	{
		"question": ["万"],
		"pronoun": ["まん"],
		"romaji": ["man"],
		"translation": ["ten thousand"]
	},
	{
		"question": ["億"],
		"pronoun": ["おく"],
		"romaji": ["oku"],
		"translation": ["one hundred million"]
	}]
var bodyparts = [
	{
		"question": ["口"],
		"pronoun": ["くち"],
		"romaji": ["kuchi"],
		"translation": ["mouth"]
	},
	{
		"question": ["頭"],
		"pronoun": ["あたま"],
		"romaji": ["atama"],
		"translation": ["head"]
	},
	{
		"question": ["手"],
		"pronoun": ["て"],
		"romaji": ["te"],
		"translation": ["hand"]
	},
	{
		"question": ["足"],
		"pronoun": ["あし"],
		"romaji": ["ashi"],
		"translation": ["foot"]
	},
	{
		"question": ["目"],
		"pronoun": ["め"],
		"romaji": ["me"],
		"translation": ["eye"]
	},
	{
		"question": ["耳"],
		"pronoun": ["みみ"],
		"romaji": ["mimi"],
		"translation": ["ear"]
	}]
var colors = [
	{
		"question": ["赤"],
		"pronoun": ["あか"],
		"romaji": ["aka"],
		"translation": ["red"]
	},
	{
		"question": ["青"],
		"pronoun": ["あお"],
		"romaji": ["ao"],
		"translation": ["blue"]
	},
	{
		"question": ["黄色"],
		"pronoun": ["きいろ"],
		"romaji": ["kiiro"],
		"translation": ["yellow"]
	},
	{
		"question": ["紫"],
		"pronoun": ["むらさき"],
		"romaji": ["murasaki"],
		"translation": ["purple"]
	},
	{
		"question": ["緑"],
		"pronoun": ["みどり"],
		"romaji": ["midori"],
		"translation": ["green"]
	},
	{
		"question": ["オレンジ色"],
		"pronoun": ["オレンジろ"],
		"romaji": ["orenjiro"],
		"translation": ["orange"]
	},
	{
		"question": ["白"],
		"pronoun": ["しろ"],
		"romaji": ["shiro"],
		"translation": ["white"]
	},
	{
		"question": ["黒"],
		"pronoun": ["くろ"],
		"romaji": ["kuro"],
		"translation": ["black"]
	},
	{
		"question": ["ピンク"],
		"pronoun": ["ピンク"],
		"romaji": ["pinku"],
		"translation": ["pink"]
	},
	{
		"question": ["灰色"],
		"pronoun": ["はいいろ"],
		"romaji": ["haiiro"],
		"translation": ["gray"]
	},
	{
		"question": ["茶色"],
		"pronoun": ["ちゃいろ"],
		"romaji": ["chairo"],
		"translation": ["brown"]
	},
	{
		"question": ["金"],
		"pronoun": ["きん"],
		"romaji": ["kin"],
		"translation": ["gold"]
	},
	{
		"question": ["銀"],
		"pronoun": ["ぎん"],
		"romaji": ["gin"],
		"translation": ["silver"]
	}]
var time = [
		{
		"question": ["午後"],
		"pronoun": ["ごご"],
		"romaji": ["gogo"],
		"translation": ["PM"]
	},
	{
		"question": ["午前"],
		"pronoun": ["ごぜん"],
		"romaji": ["gozen"],
		"translation": ["AM"]
	},
	{
		"question": [""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question": [""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question": [""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question": [""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question": [""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question": [""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},

	]

var JLPTN5 = [
	{
		"question":["浴びる"],
		"pronoun": ["あびる"],
		"romaji": ["abiru"],
		"translation": ["to bathe", "to shower"]
	},
	{
		"question":["危ない"],
		"pronoun": ["あぶない"],
		"romaji": ["abunai"],
		"translation": ["dangerous"]
	},
	{
		"question":["あっち"],
		"pronoun": ["あっち"],
		"romaji": ["acchi"],
		"translation": ["over there"]
	},
	{
		"question":["あちら"],
		"pronoun": ["あちら"],
		"romaji": ["achira"],
		"translation": ["there"]
	},
	{
		"question":["上げる"],
		"pronoun": ["あげる"],
		"romaji": ["ageru"],
		"translation": ["to raise","to elevate","to give"]
	},
	{
		"question":["赤"],
		"pronoun": ["あか"],
		"romaji": ["aka"],
		"translation": ["red"]
	},
	{
		"question":["赤い"],
		"pronoun": ["あかい"],
		"romaji": ["akai"],
		"translation": ["red"]
	},
	{
		"question":["開ける"],
		"pronoun": ["あける"],
		"romaji": ["akeru"],
		"translation": ["to unlock","to unwrap","to open"]
	},
	{
		"question":["秋"],
		"pronoun": ["あき"],
		"romaji": ["aki"],
		"translation": ["autumn","fall"]
	},
	{
		"question":[""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question":[""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question":[""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question":[""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question":[""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	},
	{
		"question":[""],
		"pronoun": [""],
		"romaji": [""],
		"translation": [""]
	}
]


pass
