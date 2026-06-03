extends Node

const SAVE_FILES: Array[String] = [SAVE_FILE0, SAVE_FILE1, SAVE_FILE2]

const SAVE_FILE0: String = "user://savegame0.save"
const SAVE_FILE1: String = "user://savegame1.save"
const SAVE_FILE2: String = "user://savegame2.save"

func save_game(save_file_path: String) -> void:
	var save_file = FileAccess.open(save_file_path, FileAccess.WRITE)
	if save_file == null:
		print("Failed to open save file for writing")
		return

	var save_dict = GameManager.get_save_data()
	save_dict["timestamp"] = format_time()
	save_dict["has_save"] = true

	save_file.store_string(JSON.stringify(save_dict))
	save_file.close()

func load_game(save_file_path: String) -> bool:
	if not FileAccess.file_exists(save_file_path):
		print("No save file found")
		return false

	var save_file = FileAccess.open(save_file_path, FileAccess.READ)
	if save_file == null:
		print("Failed to open save file for reading")
		return false

	var json_string = save_file.get_as_text()
	save_file.close()

	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		return false

	GameManager.apply_save_data(json.data)

	return true

func get_save_data(save_file_path: String) -> Dictionary:
	if not FileAccess.file_exists(save_file_path):
		return {}

	var save_file = FileAccess.open(save_file_path, FileAccess.READ)
	if save_file == null:
		return {}
	
	var json_string = save_file.get_as_text()
	save_file.close()
	
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if parse_result != OK:
		return {}
	
	return json.data

func has_save_file(save_file_path: String) -> bool:
	return FileAccess.file_exists(save_file_path)

func delete_save(save_file_path: String) -> void:
	if FileAccess.file_exists(save_file_path):
		DirAccess.remove_absolute(save_file_path)

func format_time() -> String:
	var time = Time.get_time_string_from_system().left(-3)
	var date_dict = Time.get_date_dict_from_system()
	var formatted_date = "%02d/%02d/%02d" % [date_dict.day, date_dict.month, date_dict.year % 100]
	return time + " " + formatted_date
