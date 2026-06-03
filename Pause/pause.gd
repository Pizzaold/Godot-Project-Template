extends Node

@onready var pause_screen: Control = $"../PauseScreen"

func _input(_event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		pause()

func pause() -> void:
	pause_screen.show()
	get_tree().paused = true
