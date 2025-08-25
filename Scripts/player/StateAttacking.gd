extends State

@export var player : CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func Exit():
	pass

func Enter():
	print("changed state : idle")
	animated_sprite_2d.play("Attack")

func Update(delta: float):
	if animated_sprite_2d.animation_finished:
		Transitioned.emit(self, "Idle")

func Physics_update(delta: float):
	pass
