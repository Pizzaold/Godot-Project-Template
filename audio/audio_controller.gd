extends HSlider

const CONFIG_PATH: String = "user://settings.cfg"

var audio_bus_name: String
var audio_bus_id: int

func _ready() -> void:
	audio_bus_name = self.name
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	_load_volume()
	value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(new_value))
	_save_volume(new_value)

func _load_volume() -> void:
	var config := ConfigFile.new()
	if config.load(CONFIG_PATH) == OK:
		value = config.get_value("audio", audio_bus_name, value)
	AudioServer.set_bus_volume_db(audio_bus_id, linear_to_db(value))

func _save_volume(new_value: float) -> void:
	var config := ConfigFile.new()
	config.load(CONFIG_PATH)
	config.set_value("audio", audio_bus_name, new_value)
	config.save(CONFIG_PATH)
