extends Control

func _on_back_pressed() -> void:
	GM.change_scene(GM.MAIN_MENU)

func _on_credits_pressed() -> void:
	GM.change_scene(GM.CREDITS)
