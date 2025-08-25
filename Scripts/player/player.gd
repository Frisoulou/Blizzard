extends CharacterBody2D

@export var speed = 300.0
var wood: int = 0
var near: bool = false


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move_and_slide()


func _on_area_2d_body_entered(body: TileMap) -> void:
	near = true
	print("entered ", near)

func _on_area_2d_body_exited(body: TileMap) -> void:
	near = false
	print("entered ", near)
