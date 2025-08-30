extends Control

@onready var tuto = preload("res://Scenes/Tutorial/tutorial_1_story.tscn")
@onready var main = preload("res://Scenes/main.tscn")

func _on_start_button_pressed() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(tuto)

func _on_start_notuto_pressed() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(main)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
