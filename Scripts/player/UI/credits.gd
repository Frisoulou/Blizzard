extends Control

@onready var main = preload("res://Scenes/main_menu.tscn")

func _on_back_to_main_pressed() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(main)
