extends Node

var current_save: String
var point: int = 0

func get_save_data() -> Dictionary:
	return {
		"points": point,
	}

func apply_save_data(data: Dictionary) -> void:
	point = data.get("points", 0)
