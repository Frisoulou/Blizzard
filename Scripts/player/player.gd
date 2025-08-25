extends CharacterBody2D

@export var speed = 300.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	move_and_slide()
