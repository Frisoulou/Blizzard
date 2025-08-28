extends State

@export var wolf : CharacterBody2D
@export var wolf_speed : int = 30
@export var aggro_length : int = 150
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

@onready var running: Node = $"../Running"

var player = CharacterBody2D
var wolf_direction: Vector2
var random_time: float

func random_direction():
	wolf_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	random_time = randf_range(1, 3)

func Debug():
	print("Wolf state : walking")
	pass

func Enter():
	animated_sprite_2d.play("Walking")
	player = get_tree().get_first_node_in_group("Player")
	random_direction()

func Update(delta: float):
	if random_time > 0:
		random_time -= delta
	else :
		random_direction()
		
	var player_wolf_distance = player.global_position - wolf.global_position
	if player_wolf_distance.length() < aggro_length:
		Transitioned.emit(self, "Running")
	
func Physics_update(delta: float):
	if wolf:
		wolf.velocity = wolf_direction * wolf_speed
	
	if wolf_direction.x > 0:
		animated_sprite_2d.flip_h = false
	if wolf_direction.x < 0:
		animated_sprite_2d.flip_h = true
	
