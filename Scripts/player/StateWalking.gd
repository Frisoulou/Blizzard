extends State

@export var player : CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func Exit():
	pass

func Enter():
	print("Changed state : walking")
	pass

func Update(delta: float):
	animated_sprite_2d.play("Walking")
	
	###########################################################
	###The following chunk will handle the player movement :###
	###########################################################
	#1. Define a direction vector that will store the direction
	var direction = Vector2.ZERO
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	#2. Apply normalization to the vector to avoid moving faster in diagonal
	if direction.length() > 0:
		direction = direction.normalized() * player.speed
	#3. Apply movement
	player.position += direction * delta
	
	#4. Flip the player sprite based on direction
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
	
	############################################################
	###The following chunk will handle change between state :###
	############################################################
	if direction.length() == 0:
		Transitioned.emit(self, "Idle")
		
	if Input.is_action_pressed("left_click"):
		Transitioned.emit(self, "Attacking")
	
func Physics_update(delta: float):
	pass
