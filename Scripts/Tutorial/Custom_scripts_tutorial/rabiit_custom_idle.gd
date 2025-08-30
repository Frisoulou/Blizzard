extends State

@export var rabbit: CharacterBody2D
@export var speed : int = 30
@export var flee_range : int = 50
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var player = CharacterBody2D
var direction: Vector2
var random_time: float

func Debug():
	print("Rabbit state : idle")
	pass

func Enter():
	print("Rabbit state : idle")
	animated_sprite_2d.play("Idle")
	player = get_tree().get_first_node_in_group("Player")

func Update(delta: float):
	var player_rabbit_distance = player.global_position - rabbit.global_position
	if player_rabbit_distance.length() < flee_range:
		Transitioned.emit(self, "Running")
	
func Physics_update(delta: float):
	if rabbit:
		rabbit.velocity = direction * speed
	
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
