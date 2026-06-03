extends Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()

func _on_continue_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_main_menu_pressed() -> void:
	hide()
	get_tree().paused = false
	SaveManager.save_game(GameManager.current_save)
	SceneManager.change_scene(SceneManager.MAIN_MENU)
	GameManager.point = 0

func _on_quit_pressed() -> void:
	get_tree().paused = false
	SaveManager.save_game(GameManager.current_save)
	get_tree().quit()
