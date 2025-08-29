extends State

@export var player : CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../Marker2D/AnimatedSprite2D"

func Debug():
	print("changed state : idle")
	pass

func Enter():
	pass

func Update(delta: float):
	animated_sprite_2d.play("Idle")
	
	############################################################
	###The following chunk will handle change between state :###
	############################################################s
	if Input.is_action_pressed("left_click"):
		Transitioned.emit(self, "Attacking")
		
	if Input.is_action_pressed("right") or Input.is_action_pressed("left") \
	or Input.is_action_pressed("down") or Input.is_action_pressed("up"):
		Transitioned.emit(self, "Walking")
	

func Physics_update(delta: float):
	pass
