extends Button

@export var slot_number: int

@onready var title: Label = $Title
@onready var last_played: Label = $"Last Played"
@onready var other: Label = $Other

func _ready() -> void:
	update_save_button(SaveManager.SAVE_FILES[slot_number], title, last_played, other)

func _pressed() -> void:
	choose_game(SaveManager.SAVE_FILES[slot_number])

func update_save_button(save_file: String, name_label: Label, time_label: Label, points_label: Label) -> void:
	var save_data = SaveManager.get_save_data(save_file)
	
	if save_data.is_empty():
		name_label.text = "Slot %d - Empty" % slot_number
		time_label.text = "Never"
		points_label.text = "0"
	else:
		name_label.text = "Save %d" % slot_number
		time_label.text = save_data.get("timestamp", "Unknown")
		points_label.text = "Points: %d" % save_data.get("points", 0)

func choose_game(save_file: String) -> void:
	if SaveManager.has_save_file(save_file):
		SaveManager.load_game(save_file)
		GameManager.current_save = save_file
		SceneManager.change_scene(SceneManager.MAIN)
		print("Loading game from: ", save_file)
	else:
		GameManager.current_save = save_file
		print("Starting new game in slot: ", save_file)
		SceneManager.change_scene(SceneManager.MAIN)


func _on_delete_pressed() -> void:
	SaveManager.delete_save(SaveManager.SAVE_FILES[slot_number])
	update_save_button(SaveManager.SAVE_FILES[slot_number], title, last_played, other)
