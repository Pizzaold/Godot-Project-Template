extends Control

func _on_play_pressed() -> void:
	GM.change_scene(GM.SAVEGAME)

func _on_settings_pressed() -> void:
	GM.change_scene(GM.SETTINGS)

func _on_quit_pressed() -> void:
	get_tree().quit()
