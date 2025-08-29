extends Control

@onready var level = preload("res://Scenes/main.tscn")

func _on_start_button_button_down() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(level)


func _on_quit_button_button_down() -> void:
	get_tree().quit()
