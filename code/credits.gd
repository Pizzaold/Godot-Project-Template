extends Control

@onready var rich_text_label: RichTextLabel = $RichTextLabel
var scroll_speed: float = 40.0

func _physics_process(delta: float) -> void:
	var scroll_bar = rich_text_label.get_v_scroll_bar()
	scroll_bar.value += scroll_speed * delta

func _on_back_pressed() -> void:
	GM.change_scene(GM.SETTINGS)
