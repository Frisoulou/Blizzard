extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var wolf : CharacterBody2D
@export var attack_range : int = 35
@onready var state_machine: Node = $".."
@onready var attack_length_timer: Timer = $AttackLengthTimer
@export var attack_length : float = 0.75
@export var wolf_speed : int = 60

@export var player_stats_manager = Node
var player = CharacterBody2D

func Debug():
	print("Wolf state : attacking")
	pass

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	animated_sprite_2d.play("Attacking")
	attack_length_timer.start(attack_length)
	
func Physics_update(delta: float) -> void:
	var wolf_direction = player.global_position - wolf.global_position
	wolf.velocity = wolf_direction.normalized() * wolf_speed
	
	if wolf_direction.x > 0:
		animated_sprite_2d.flip_h = false
	if wolf_direction.x < 0:
		animated_sprite_2d.flip_h = true
	pass

func _on_attack_length_timer_timeout() -> void:
	var wolf_player_distance = (state_machine.player.global_position - wolf.global_position).length()
	if wolf_player_distance > attack_range:
		Transitioned.emit(self, "Running")
	else :
		if animated_sprite_2d.visible:
			state_machine.player.get_child(0)._on_damage_taken()
			attack_length_timer.start(attack_length)
