extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var wolf : CharacterBody2D
@export var attack_range : int = 35
@onready var state_machine: Node = $".."
@onready var attack_length_timer: Timer = $AttackLengthTimer
@export var attack_length : float = 1.0

@export var player_stats_manager = Node

func Debug():
	print("Wolf state : attacking")
	pass

func Enter():
	print("Wolf state : attacking")
	animated_sprite_2d.play("Attacking")
	attack_length_timer.start(attack_length)
	
func _physics_process(delta: float) -> void:
	pass

func _on_attack_length_timer_timeout() -> void:
	var wolf_player_distance = (state_machine.player.global_position - wolf.global_position).length()
	
	if wolf_player_distance > attack_range:
		Transitioned.emit(self, "Running")
	else:
		print("player took damage : ", state_machine.player.get_child(0).speed)
		attack_length_timer.start(attack_length)
