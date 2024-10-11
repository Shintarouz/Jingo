extends Node2D
const file_path = "user://savegame.json"

var aiueo = [
	{
		"question": "あ",
		"answer": "a"
	},
	{
		"question": "い",
		"answer" : "i"
	},
	{
		"question": "う",
		"answer": "u"
	},
	{
		"question": "え",
		"answer": "e"
	},
	{
		"question": "お",
		"answer": "o"
	}]
var kakikukeko = [
	{
		"question" : "か",
		"answer" : "ka",
	},
	{
		"question" : "き",
		"answer" : "ki"
	},
	{
		"question" : "く",
		"answer" : "ku"
	},
	{
		"question" : "け",
		"answer" : "ke"
	},
	{
		"question" : "こ",
		"answer" : "ko"
	}]
var sashisuseso = [
	{
		"question" : "さ",
		"answer" : "sa"
	},
	{
		"question" : "し",
		"answer" : "shi"
	},
	{
		"question" : "す",
		"answer" : "su"
	},
	{
		"question" : "せ",
		"answer" : "se"
	},
	{
		"question" : "そ",
		"answer" : "so"
	}]
var tachitsuteto = [
	{
		"question" : "た",
		"answer" : "ta"
	},
	{
		"question" : "ち",
		"answer" : "chi"
	},
	{
		"question" : "つ",
		"answer" : "tsu"
	},
	{
		"question" : "て",
		"answer" : "te"
	},
	{
		"question" : "と",
		"answer" : "to"
	}
	]
var naninuneno = [
	{
		"question" : "な",
		"answer" : "na"
	},
	{
		"question" : "に",
		"answer" : "ni"
	},
	{
		"question" : "ぬ",
		"answer" : "nu"
	},
	{
		"question" : "ね",
		"answer" : "ne"
	},
	{
		"question" : "の",
		"answer" : "no"
	}
	]
var hahifuheho = [
	{
		"question" : "は",
		"answer" : "ha"
	},
	{
		"question" : "ひ",
		"answer" : "hi"
	},
	{
		"question" : "ふ",
		"answer" : "fu"
	},
	{
		"question" : "へ",
		"answer" : "he"
	},
	{
		"question" : "ほ",
		"answer" : "ho"
	}]
var mamimumemo = [
	{
		"question" : "ま",
		"answer" : "ma"
	},
	{
		"question" : "み",
		"answer" : "mi"
	},
	{
		"question" : "む",
		"answer" : "mu"
	},
	{
		"question" : "め",
		"answer" : "me"
	},
	{
		"question" : "も",
		"answer" : "mo"
	}]
var yayuyo = [
	{
		"question" : "や",
		"answer" : "ya"
	},
	{
		"question" : "ゆ",
		"answer" : "yu"
	},
	{
		"question" : "よ",
		"answer" : "yo"
	}]
var rarirurero = [
	{
		"question" : "ら",
		"answer" : "ra"
	},
	{
		"question" : "り",
		"answer" : "ri"
	},
	{
		"question" : "る",
		"answer" : "ru"
	},
	{
		"question" : "れ",
		"answer" : "re"
	},
	{
		"question" : "ろ",
		"answer" : "ro"
	}]
var wanwo = [
	{
		"question" : "わ",
		"answer" : "wa"
	},
	{
		"question" : "ん",
		"answer" : "n"
	},
	{
		"question" : "を",
		"answer" : "wo"
	}]

func _ready():
	if DictionaryData.HiraCheck1 == true:
		$ScrollContainer/GridContainer/a_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/i_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/u_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/e_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/o_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck2 == true:
		$ScrollContainer/GridContainer/ka_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ki_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ku_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ke_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ko_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck3 == true:
		$ScrollContainer/GridContainer/sa_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/shi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/su_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/se_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/so_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck4 == true:
		$ScrollContainer/GridContainer/ta_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/chi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/tsu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/te_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/to_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck5 == true:
		$ScrollContainer/GridContainer/na_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ni_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/nu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ne_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/no_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck6 == true:
		$ScrollContainer/GridContainer/ha_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/hi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/fu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/he_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ho_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck7 == true:
		$ScrollContainer/GridContainer/ma_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/mi_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/mu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/me_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/mo_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck8 == true:
		$ScrollContainer/GridContainer/ya_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/yu_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/yo_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck9 == true:
		$ScrollContainer/GridContainer/ra_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ri_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ru_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/re_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/ro_button.modulate = Color.GREEN
	if DictionaryData.HiraCheck10 == true:
		$ScrollContainer/GridContainer/wa_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/n_button.modulate = Color.GREEN
		$ScrollContainer/GridContainer/wo_button.modulate = Color.GREEN

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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/hiragana_game.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/aiueo_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/kakikukeko_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/sashisuseso_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/tachitsuteto_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/naninuneno_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/hahifuheho_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/mamimumemo_game_hiragana.tscn")


func _on_ya_button_pressed():
	_yayuyo_button()
func _on_yu_button_pressed():
	_yayuyo_button()
func _on_yo_button_pressed():
	_yayuyo_button()
func _yayuyo_button():
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/yayuyo_game_hiragana.tscn")


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
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/rarirurero_game_hiragana.tscn")


func _on_wa_button_pressed():
	_wanwo_button()
func _on_n_button_pressed():
	_wanwo_button()
func _on_wo_button_pressed():
	_wanwo_button()
func _wanwo_button():
	get_tree().change_scene_to_file("res://Scenes/hiragana_game_scenes/wanwo_game_hiragana.tscn")


func _on_button_pressed():
	pass
