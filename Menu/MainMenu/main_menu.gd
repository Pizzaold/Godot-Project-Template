extends Control

func _on_play_pressed() -> void:
	SceneManager.change_scene(SceneManager.SAVEGAME)

func _on_settings_pressed() -> void:
	SceneManager.change_scene(SceneManager.SETTINGS)

func _on_quit_pressed() -> void:
	get_tree().quit()
