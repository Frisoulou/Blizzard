extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var wolf : CharacterBody2D
@export var attack_length : int = 35
@onready var state_machine: Node = $".."

func Enter():
	print("Wolf state : attacking")
	animated_sprite_2d.play("Attacking")
	wolf.velocity = Vector2()
	
func _physics_process(delta: float) -> void:
	var wolf_direction = state_machine.player.global_position - wolf.global_position
	
	if wolf_direction.length() > attack_length:
		Transitioned.emit(self, "Running")
	pass
