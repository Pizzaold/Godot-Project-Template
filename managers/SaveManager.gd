extends Node

const SAVE_FILES: Array[String] = [SAVE_FILE0, SAVE_FILE1, SAVE_FILE2]

const SAVE_FILE0: String = "user://savegame0.save"
const SAVE_FILE1: String = "user://savegame1.save"
const SAVE_FILE2: String = "user://savegame2.save"

func save_game(SAVE_FILE) -> void:
	var save_file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if save_file == null:
		print("Failed to open save file for writing")
		return
	
	var save_dict = {
		"points": GM.point,
		"timestamp": format_time(),
		"has_save": true
	}
	
	save_file.store_string(JSON.stringify(save_dict))
	save_file.close()
	print("Game saved successfully")

func load_game(SAVE_FILE) -> bool:
	if not FileAccess.file_exists(SAVE_FILE):
		print("No save file found")
		return false
	
	var save_file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if save_file == null:
		print("Failed to open save file for reading")
		return false
	
	var json_string = save_file.get_as_text()
	save_file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		print("Failed to parse save file")
		return false
	
	var save_data = json.data
	
	GM.point = save_data.get("points", 0)
	
	print("Game loaded successfully")
	return true

func get_save_data(SAVE_FILE) -> Dictionary:
	if not FileAccess.file_exists(SAVE_FILE):
		return {}
	
	var save_file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if save_file == null:
		return {}
	
	var json_string = save_file.get_as_text()
	save_file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		return {}
	
	return json.data

func has_save_file(SAVE_FILE) -> bool:
	return FileAccess.file_exists(SAVE_FILE)

func delete_save(SAVE_FILE) -> void:
	if FileAccess.file_exists(SAVE_FILE):
		DirAccess.remove_absolute(SAVE_FILE)
		print("Save file deleted")

func format_time() -> String:
	var time = Time.get_time_string_from_system().left(-3)
	var date_dict = Time.get_date_dict_from_system()
	var formatted_date = "%02d/%02d/%02d" % [date_dict.day, date_dict.month, date_dict.year % 100]
	return time + " " + formatted_date
