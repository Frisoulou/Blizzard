extends State

@export var wolf : CharacterBody2D
@export var wolf_speed : int = 60
@export var aggro_length : int = 150
@export var attack_length : int = 35
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var player = CharacterBody2D

func Debug():
	print("Wolf state : running")
	pass

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	animated_sprite_2d.play("Running")
	
func _physics_process(delta: float) -> void:
	var wolf_direction = player.global_position - wolf.global_position
	
	if wolf_direction.length() < aggro_length and wolf_direction.length() > attack_length:
		wolf.velocity = wolf_direction.normalized() * wolf_speed
	else: if wolf_direction.length() > aggro_length:
		Transitioned.emit(self, "Walking")
	else:
		Transitioned.emit(self, "Attacking")
	
	if wolf_direction.x > 0:
		animated_sprite_2d.flip_h = false
	if wolf_direction.x < 0:
		animated_sprite_2d.flip_h = true
	pass
