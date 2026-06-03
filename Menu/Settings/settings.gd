extends Control

func _on_back_pressed() -> void:
	SceneManager.change_scene(SceneManager.MAIN_MENU)

func _on_credits_pressed() -> void:
	SceneManager.change_scene(SceneManager.CREDITS)
