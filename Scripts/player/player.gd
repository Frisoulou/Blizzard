extends CharacterBody2D

@export var speed = 300.0

func _process(delta: float) -> void:
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
		direction = direction.normalized() * speed
	
	#3. Apply movement
	position += direction * delta
	
	move_and_slide()
	
	###########################################################
	###The following chunk will handle the player attack :  ###
	###########################################################
	if Input.is_action_pressed("left_click"):
		$AnimatedSprite2D.play("Attack")
	
	if $AnimatedSprite2D.animation_finished:
		$AnimatedSprite2D.play("Idle")
