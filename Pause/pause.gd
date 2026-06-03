extends Node

@onready var pause_screen: Control = $"../PauseScreen"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		pause()

func pause() -> void:
	pause_screen.show()
	get_tree().paused = true
