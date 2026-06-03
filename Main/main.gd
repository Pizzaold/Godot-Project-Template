extends Control

@onready var button: Button = $Button
@onready var label: Label = $Label

func _ready() -> void:
	update_label()

func _on_button_pressed() -> void:
	GameManager.point += 1
	update_label()

func update_label():
	label.text = "Points: %d" % GameManager.point 

func _on_save_pressed() -> void:
	SaveManager.save_game(GameManager.current_save)
