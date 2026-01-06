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
	SM.save_game(GM.current_save)
	GM.change_scene(GM.MAIN_MENU)

func _on_quit_pressed() -> void:
	get_tree().paused = false
	SM.save_game(GM.current_save)
	get_tree().quit()
