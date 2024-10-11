extends Node2D

var aiueo = [
	{
		"question": "ア",
		"answer": "a"
	},
	{
		"question": "イ",
		"answer" : "i"
	},
	{
		"question": "ウ",
		"answer": "u"
	},
	{
		"question": "エ",
		"answer": "e"
	},
	{
		"question": "オ",
		"answer": "o"
	}]
var kakikukeko = [
	{
		"question" : "カ",
		"answer" : "ka",
	},
	{
		"question" : "キ",
		"answer" : "ki"
	},
	{
		"question" : "ク",
		"answer" : "ku"
	},
	{
		"question" : "ケ",
		"answer" : "ke"
	},
	{
		"question" : "コ",
		"answer" : "ko"
	}]
var sashisuseso = [
	{
		"question" : "サ",
		"answer" : "sa"
	},
	{
		"question" : "シ",
		"answer" : "shi"
	},
	{
		"question" : "ス",
		"answer" : "su"
	},
	{
		"question" : "セ",
		"answer" : "se"
	},
	{
		"question" : "ソ",
		"answer" : "so"
	}]
var tachitsuteto = [
	{
		"question" : "タ",
		"answer" : "ta"
	},
	{
		"question" : "チ",
		"answer" : "chi"
	},
	{
		"question" : "ッ",
		"answer" : "tsu"
	},
	{
		"question" : "テ",
		"answer" : "te"
	},
	{
		"question" : "ト",
		"answer" : "to"
	}
	]
var naninuneno = [
	{
		"question" : "ナ",
		"answer" : "na"
	},
	{
		"question" : "二",
		"answer" : "ni"
	},
	{
		"question" : "ヌ",
		"answer" : "nu"
	},
	{
		"question" : "ネ",
		"answer" : "ne"
	},
	{
		"question" : "ノ",
		"answer" : "no"
	}
	]
var hahifuheho = [
	{
		"question" : "ハ",
		"answer" : "ha"
	},
	{
		"question" : "ヒ",
		"answer" : "hi"
	},
	{
		"question" : "フ",
		"answer" : "fu"
	},
	{
		"question" : "ヘ",
		"answer" : "he"
	},
	{
		"question" : "ホ",
		"answer" : "ho"
	}]
var mamimumemo = [
	{
		"question" : "マ",
		"answer" : "ma"
	},
	{
		"question" : "ミ",
		"answer" : "mi"
	},
	{
		"question" : "ム",
		"answer" : "mu"
	},
	{
		"question" : "メ",
		"answer" : "me"
	},
	{
		"question" : "モ",
		"answer" : "mo"
	}]
var yayuyo = [
	{
		"question" : "ヤ",
		"answer" : "ya"
	},
	{
		"question" : "ユ",
		"answer" : "yu"
	},
	{
		"question" : "ヨ",
		"answer" : "yo"
	}]
var rarirurero = [
	{
		"question" : "ラ",
		"answer" : "ra"
	},
	{
		"question" : "リ",
		"answer" : "ri"
	},
	{
		"question" : "ル",
		"answer" : "ru"
	},
	{
		"question" : "レ",
		"answer" : "re"
	},
	{
		"question" : "ロ",
		"answer" : "ro"
	}]
var wanwo = [
	{
		"question" : "ワ",
		"answer" : "wa"
	},
	{
		"question" : "ン",
		"answer" : "n"
	},
	{
		"question" : "ヲ",
		"answer" : "wo"
	}]

func _process(delta):
	if DictionaryData.check11 == true:
		$ScrollContainer/GridContainer/a_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/i_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/u_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/e_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/o_button.modulate = Color.GREEN
	if DictionaryData.check12 == true:
		$ScrollContainer/GridContainer/ka_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ki_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ku_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ke_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ko_button.modulate = Color.GREEN
	if DictionaryData.check13 == true:
		$ScrollContainer/GridContainer/sa_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/shi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/su_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/se_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/so_button.modulate = Color.GREEN
	if DictionaryData.check14 == true:
		$ScrollContainer/GridContainer/ta_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/chi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/tsu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/te_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/to_button.modulate = Color.GREEN
	if DictionaryData.check15 == true:
		$ScrollContainer/GridContainer/na_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ni_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/nu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ne_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/no_button.modulate = Color.GREEN
	if DictionaryData.check16 == true:
		$ScrollContainer/GridContainer/ha_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/hi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/fu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/he_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ho_button.modulate = Color.GREEN
	if DictionaryData.check17 == true:
		$ScrollContainer/GridContainer/ma_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/mi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/mu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/me_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/mo_button.modulate = Color.GREEN
	if DictionaryData.check18 == true:
		$ScrollContainer/GridContainer/ya_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/yu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/yo_button.modulate = Color.GREEN
	if DictionaryData.check19 == true:
		$ScrollContainer/GridContainer/ra_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ri_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ru_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/re_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ro_button.modulate = Color.GREEN
	if DictionaryData.check20 == true:
		$ScrollContainer/GridContainer/wa_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/n_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/wo_button.modulate = Color.GREEN

func _ready():
	$ScrollContainer/GridContainer/a_button.text = str(aiueo[0]["question"])
	$ScrollContainer/GridContainer/i_button.text = str(aiueo[1]["question"])
	$ScrollContainer/GridContainer/u_button.text = str(aiueo[2]["question"])
	$ScrollContainer/GridContainer/e_button.text = str(aiueo[3]["question"])
	$ScrollContainer/GridContainer/o_button.text = str(aiueo[4]["question"])
	$ScrollContainer/GridContainer/ka_button.text = str(kakikukeko[0]["question"])
	$ScrollContainer/GridContainer/ki_button.text = str(kakikukeko[1]["question"])
	$ScrollContainer/GridContainer/ku_button.text = str(kakikukeko[2]["question"])
	$ScrollContainer/GridContainer/ke_button.text = str(kakikukeko[3]["question"])
	$ScrollContainer/GridContainer/ko_button.text = str(kakikukeko[4]["question"])
	$ScrollContainer/GridContainer/sa_button.text = str(sashisuseso[0]["question"])
	$ScrollContainer/GridContainer/shi_button.text = str(sashisuseso[1]["question"])
	$ScrollContainer/GridContainer/su_button.text = str(sashisuseso[2]["question"])
	$ScrollContainer/GridContainer/se_button.text = str(sashisuseso[3]["question"])
	$ScrollContainer/GridContainer/so_button.text = str(sashisuseso[4]["question"])
	$ScrollContainer/GridContainer/ta_button.text = str(tachitsuteto[0]["question"])
	$ScrollContainer/GridContainer/chi_button.text = str(tachitsuteto[1]["question"])
	$ScrollContainer/GridContainer/tsu_button.text = str(tachitsuteto[2]["question"])
	$ScrollContainer/GridContainer/te_button.text = str(tachitsuteto[3]["question"])
	$ScrollContainer/GridContainer/to_button.text = str(tachitsuteto[4]["question"])
	$ScrollContainer/GridContainer/na_button.text = str(naninuneno[0]["question"])
	$ScrollContainer/GridContainer/ni_button.text = str(naninuneno[1]["question"])
	$ScrollContainer/GridContainer/nu_button.text = str(naninuneno[2]["question"])
	$ScrollContainer/GridContainer/ne_button.text = str(naninuneno[3]["question"])
	$ScrollContainer/GridContainer/no_button.text = str(naninuneno[4]["question"])
	$ScrollContainer/GridContainer/ha_button.text = str(hahifuheho[0]["question"])
	$ScrollContainer/GridContainer/hi_button.text = str(hahifuheho[1]["question"])
	$ScrollContainer/GridContainer/fu_button.text = str(hahifuheho[2]["question"])
	$ScrollContainer/GridContainer/he_button.text = str(hahifuheho[3]["question"])
	$ScrollContainer/GridContainer/ho_button.text = str(hahifuheho[4]["question"])
	$ScrollContainer/GridContainer/ma_button.text = str(mamimumemo[0]["question"])
	$ScrollContainer/GridContainer/mi_button.text = str(mamimumemo[1]["question"])
	$ScrollContainer/GridContainer/mu_button.text = str(mamimumemo[2]["question"])
	$ScrollContainer/GridContainer/me_button.text = str(mamimumemo[3]["question"])
	$ScrollContainer/GridContainer/mo_button.text = str(mamimumemo[4]["question"])
	$ScrollContainer/GridContainer/ya_button.text = str(yayuyo[0]["question"])
	$ScrollContainer/GridContainer/yu_button.text = str(yayuyo[1]["question"])
	$ScrollContainer/GridContainer/yo_button.text = str(yayuyo[2]["question"])
	$ScrollContainer/GridContainer/ra_button.text = str(rarirurero[0]["question"])
	$ScrollContainer/GridContainer/ri_button.text = str(rarirurero[1]["question"])
	$ScrollContainer/GridContainer/ru_button.text = str(rarirurero[2]["question"])
	$ScrollContainer/GridContainer/re_button.text = str(rarirurero[3]["question"])
	$ScrollContainer/GridContainer/ro_button.text = str(rarirurero[4]["question"])
	$ScrollContainer/GridContainer/wa_button.text = str(wanwo[0]["question"])
	$ScrollContainer/GridContainer/n_button.text = str(wanwo[1]["question"])
	$ScrollContainer/GridContainer/wo_button.text = str(wanwo[2]["question"])


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/mode_menu.tscn")
func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/katakana_game.tscn")


func _on_a_button_pressed():
	_aiueo_button()
func _on_i_button_pressed():
	_aiueo_button()
func _on_u_button_pressed():
	_aiueo_button()
func _on_e_button_pressed():
	_aiueo_button()
func _on_o_button_pressed():
	_aiueo_button()
func _aiueo_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/aiueo_game_katakana.tscn")


func _on_ka_button_pressed():
	_kakikukeko_button()
func _on_ki_button_pressed():
	_kakikukeko_button()
func _on_ku_button_pressed():
	_kakikukeko_button()
func _on_ke_button_pressed():
	_kakikukeko_button()
func _on_ko_button_pressed():
	_kakikukeko_button()
func _kakikukeko_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/kakikukeko_game_katakana.tscn")


func _on_sa_button_pressed():
	_sashisuseso_button()
func _on_shi_button_pressed():
	_sashisuseso_button()
func _on_su_button_pressed():
	_sashisuseso_button()
func _on_se_button_pressed():
	_sashisuseso_button()
func _on_so_button_pressed():
	_sashisuseso_button()
func _sashisuseso_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/sashisuseso_game_katakana.tscn")


func _on_ta_button_pressed():
	_tachitsuteto_button()
func _on_chi_button_pressed():
	_tachitsuteto_button()
func _on_tsu_button_pressed():
	_tachitsuteto_button()
func _on_te_button_pressed():
	_tachitsuteto_button()
func _on_to_button_pressed():
	_tachitsuteto_button()
func _tachitsuteto_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/tachitsuteto_game_katakana.tscn")


func _on_na_button_pressed():
	_naninuneno_button()
func _on_ni_button_pressed():
	_naninuneno_button()
func _on_nu_button_pressed():
	_naninuneno_button()
func _on_ne_button_pressed():
	_naninuneno_button()
func _on_no_button_pressed():
	_naninuneno_button()
func _naninuneno_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/naninuneno_game_katakana.tscn")


func _on_ha_button_pressed():
	_hahifuheho_button()
func _on_hi_button_pressed():
	_hahifuheho_button()
func _on_fu_button_pressed():
	_hahifuheho_button()
func _on_he_button_pressed():
	_hahifuheho_button()
func _on_ho_button_pressed():
	_hahifuheho_button()
func _hahifuheho_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/hahifuheho_game_katakana.tscn")


func _on_ma_button_pressed():
	_mamimumemo_button()
func _on_mi_button_pressed():
	_mamimumemo_button()
func _on_mu_button_pressed():
	_mamimumemo_button()
func _on_me_button_pressed():
	_mamimumemo_button()
func _on_mo_button_pressed():
	_mamimumemo_button()
func 	_mamimumemo_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/mamimumemo_game_katakana.tscn")


func _on_ya_button_pressed():
	_yayuyo_button()
func _on_yu_button_pressed():
	_yayuyo_button()
func _on_yo_button_pressed():
	_yayuyo_button()
func _yayuyo_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/yayuyo_game_katakana.tscn")


func _on_ra_button_pressed():
	_rarirurero_button()
func _on_ri_button_pressed():
	_rarirurero_button()
func _on_ru_button_pressed():
	_rarirurero_button()
func _on_re_button_pressed():
	_rarirurero_button()
func _on_ro_button_pressed():
	_rarirurero_button()
func _rarirurero_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/rarirurero_game_katakana.tscn")


func _on_wa_button_pressed():
	_wanwo_button()
func _on_n_button_pressed():
	_wanwo_button()
func _on_wo_button_pressed():
	_wanwo_button()
func _wanwo_button():
	get_tree().change_scene_to_file("res://Scenes/katakana_game_scenes/wanwo_game_katakana.tscn")
