extends Control

@onready var credits = preload("res://Scenes/UI/Credits.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_packed(credits)
