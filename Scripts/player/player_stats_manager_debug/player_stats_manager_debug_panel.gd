extends Control

@export var player : CharacterBody2D

func _ready() -> void:
	if player.get_child(0).debug_mode == false:
		self.visible = false
