extends Node
var HiraCheck1: bool
var HiraCheck2: bool
var HiraCheck3: bool
var HiraCheck4: bool
var HiraCheck5: bool
var HiraCheck6: bool
var HiraCheck7: bool
var HiraCheck8: bool
var HiraCheck9: bool
var HiraCheck10: bool

var KataCheck1: bool
var KataCheck2: bool
var KataCheck3: bool
var KataCheck4: bool
var KataCheck5: bool
var KataCheck6: bool
var KataCheck7: bool
var KataCheck8: bool
var KataCheck9: bool
var KataCheck10: bool

var KanjiCheck1 : bool
var KanjiCheck2 : bool
var KanjiCheck3 : bool
var KanjiCheck4 : bool
var KanjiCheck5 : bool
var KanjiCheck6 : bool
var KanjiCheck7 : bool
var KanjiCheck8 : bool
var KanjiCheck9 : bool
var KanjiCheck10 : bool

var VocabCheck1 : bool
var VocabCheck2 : bool
var VocabCheck3 : bool
var VocabCheck4 : bool
var VocabCheck5 : bool
var VocabCheck6 : bool
var VocabCheck7 : bool
var VocabCheck8 : bool
var VocabCheck9 : bool
var VocabCheck10 : bool





func _ready():
	var JsonFile = FileAccess.open("res://savegame.json", FileAccess.READ)
	var JsonString = JsonFile.get_as_text()
	JsonFile.close()
	
	# from json string to dictionary
	var Data = JSON.parse_string(JsonString)
	print(Data)
	HiraCheck1 = Data.HiraCheck1
	HiraCheck2 = Data.HiraCheck2
	HiraCheck3 = Data.HiraCheck3
	HiraCheck4 = Data.HiraCheck4
	HiraCheck5 = Data.HiraCheck5
	HiraCheck6 = Data.HiraCheck6
	HiraCheck7 = Data.HiraCheck7
	HiraCheck8 = Data.HiraCheck8
	HiraCheck9 = Data.HiraCheck9
	HiraCheck10 = Data.HiraCheck10

	KataCheck1 = Data.KataCheck1
	KataCheck2 = Data.KataCheck2
	KataCheck3 = Data.KataCheck3
	KataCheck4 = Data.KataCheck4
	KataCheck5 = Data.KataCheck5
	KataCheck6 = Data.KataCheck6
	KataCheck7 = Data.KataCheck7
	KataCheck8 = Data.KataCheck8
	KataCheck9 = Data.KataCheck9
	KataCheck10 = Data.KataCheck10

	KanjiCheck1 = Data.KanjiCheck1
	KanjiCheck2 = Data.KanjiCheck2
	KanjiCheck3 = Data.KanjiCheck3
	KanjiCheck4 = Data.KanjiCheck4
	KanjiCheck5 = Data.KanjiCheck5
	KanjiCheck6 = Data.KanjiCheck6
	KanjiCheck7 = Data.KanjiCheck7
	KanjiCheck8 = Data.KanjiCheck8
	KanjiCheck9 = Data.KanjiCheck9
	KanjiCheck10 = Data.KanjiCheck10

	#VocabCheck1 = Data.VocabCheck1
	#VocabCheck2 = Data.VocabCheck2
	#VocabCheck3 = Data.VocabCheck3
	#VocabCheck4 = Data.VocabCheck4
	#VocabCheck5 = Data.VocabCheck5
	#VocabCheck6 = Data.VocabCheck6
	#VocabCheck7 = Data.VocabCheck7
	#VocabCheck8 = Data.VocabCheck8
	#VocabCheck9 = Data.VocabCheck9
	#VocabCheck10 = Data.VocabCheck10




func save():
	var datatest = {
		"HiraCheck1" : HiraCheck1,
		"HiraCheck2" : HiraCheck2,
		"HiraCheck3" : HiraCheck3,
		"HiraCheck4" : HiraCheck4,
		"HiraCheck5" : HiraCheck5,
		"HiraCheck6" : HiraCheck6,
		"HiraCheck7" : HiraCheck7,
		"HiraCheck8" : HiraCheck8,
		"HiraCheck9" : HiraCheck9,
		"HiraCheck10" : HiraCheck10,
		
		"KataCheck1" : KataCheck1,
		"KataCheck2" : KataCheck2,
		"KataCheck3" : KataCheck3,
		"KataCheck4" : KataCheck4,
		"KataCheck5" : KataCheck5,
		"KataCheck6" : KataCheck6,
		"KataCheck7" : KataCheck7,
		"KataCheck8" : KataCheck8,
		"KataCheck9" : KataCheck9,
		"KataCheck10" : KataCheck10,
		
		"KanjiCheck1" : KanjiCheck1,
		"KanjiCheck2" : KanjiCheck2,
		"KanjiCheck3" : KanjiCheck3,
		"KanjiCheck4" : KanjiCheck4,
		"KanjiCheck5" : KanjiCheck5,
		"KanjiCheck6" : KanjiCheck6,
		"KanjiCheck7" : KanjiCheck7,
		"KanjiCheck8" : KanjiCheck8,
		"KanjiCheck9" : KanjiCheck9,
		"KanjiCheck10" : KanjiCheck10,
		
		#"VocabCheck1 ": VocabCheck1,
		#"VocabCheck2 ": VocabCheck2,
		#"VocabCheck3 ": VocabCheck3,
		#"VocabCheck4 ": VocabCheck4,
		#"VocabCheck5 ": VocabCheck5,
		#"VocabCheck6 ": VocabCheck6,
		#"VocabCheck7 ": VocabCheck7,
		#"VocabCheck8 ": VocabCheck8,
		#"VocabCheck9 ": VocabCheck9, 
		#"VocabCheck10" : VocabCheck10

	}
	
	var JsonString = JSON.stringify(datatest)
	var JsonFile = FileAccess.open("res://savegame.json", FileAccess.WRITE)
	JsonFile.store_line(JsonString)
	JsonFile.close()



func _on_load_pressed():
	var JsonFile = FileAccess.open("res://savegame.json", FileAccess.READ)
	var JsonString = JsonFile.get_as_text()
	JsonFile.close()
	
	# from json string to dictionary
	var Data = JSON.parse_string(JsonString)
	print(Data)


func _on_reset_pressed():
	HiraCheck1 = false
	HiraCheck2 = false
	HiraCheck3 = false
	HiraCheck4 = false
	HiraCheck5 = false
	HiraCheck6 = false
	HiraCheck7 = false
	HiraCheck8 = false
	HiraCheck9 = false
	HiraCheck10 = false

	KataCheck1 = false
	KataCheck2 = false
	KataCheck3 = false
	KataCheck4 = false
	KataCheck5 = false
	KataCheck6 = false
	KataCheck7 = false
	KataCheck8 = false
	KataCheck9 = false
	KataCheck10 = false

	KanjiCheck1 = false
	KanjiCheck2 = false
	KanjiCheck3 = false
	KanjiCheck4 = false
	KanjiCheck5 = false
	KanjiCheck6 = false
	KanjiCheck7 = false
	KanjiCheck8 = false
	KanjiCheck9 = false
	KanjiCheck10 = false

	VocabCheck1 = false
	VocabCheck2 = false
	VocabCheck3 = false
	VocabCheck4 = false
	VocabCheck5 = false
	VocabCheck6 = false
	VocabCheck7 = false
	VocabCheck8 = false
	VocabCheck9 = false
	VocabCheck10 = false
	
	save()
