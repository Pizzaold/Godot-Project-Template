extends Node

const MAIN_MENU: String = "res://Menu/MainMenu/main_menu.tscn"
const SETTINGS: String = "res://Menu/Settings/settings.tscn"
const CREDITS: String = "res://Menu/Settings/credits.tscn"
const SAVEGAME: String = "res://Menu/SaveMenu/save_games.tscn"
const MAIN: String = "res://Main/main.tscn"

func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
