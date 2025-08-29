extends State

@export var rabbit: CharacterBody2D
@export var speed : int = 60
@export var back_to_idle_range : int = 150
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var player = CharacterBody2D

func Debug():
	print("Rabbit state : running")
	pass

func Enter():
	print("Rabbit state : running")
	animated_sprite_2d.play("Idle")
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_update(delta: float) -> void:
	var direction = -(player.global_position - rabbit.global_position)
	if direction.length() < back_to_idle_range:
		rabbit.velocity = direction.normalized() * speed
	else: if direction.length() > back_to_idle_range:
		Transitioned.emit(self, "Idle")
	
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
	pass
