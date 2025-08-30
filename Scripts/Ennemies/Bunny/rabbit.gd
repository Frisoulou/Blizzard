extends CharacterBody2D

@onready var rabbit: CharacterBody2D = $"."
@onready var health_point: ProgressBar = $ProgressBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: Node = $StateMachine

func _on_damage_taken(damage, attacker):
	health_point.value -= damage
	health_point.visible = true
	
	if health_point.value <= 0:
		state_machine.on_child_transition(state_machine.current_state, "Dead")
	
func _physics_process(delta: float) -> void:
	move_and_slide()
