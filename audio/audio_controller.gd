extends HSlider

var audio_bus_name: String

var audio_bus_id: int

func _ready():
	audio_bus_name = self.name
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	value_changed.connect(_on_value_changed)

func _on_value_changed(_value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(_value))
