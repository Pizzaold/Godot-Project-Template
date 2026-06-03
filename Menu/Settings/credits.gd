extends Control

@onready var rich_text_label: RichTextLabel = $RichTextLabel
var scroll_speed: float = 100.0
var scroll_bar: VScrollBar

func _ready() -> void:
	scroll_bar = rich_text_label.get_v_scroll_bar()

func _process(delta: float) -> void:
	scroll_bar.value += scroll_speed * delta

func _on_back_pressed() -> void:
	SceneManager.change_scene(SceneManager.SETTINGS)
