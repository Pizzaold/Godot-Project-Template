extends Node

const MAIN_MENU: String = "res://scenes/main_menu.tscn"
const SETTINGS: String = "res://scenes/settings.tscn"
const CREDITS: String = "res://scenes/credits.tscn"
const SAVEGAME: String = "res://scenes/save_games.tscn"
const MAIN: String = "res://scenes/main.tscn"

var current_save: String

var point: int = 0

func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
