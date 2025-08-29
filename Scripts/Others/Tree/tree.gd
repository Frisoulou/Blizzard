extends StaticBody2D

@onready var tree: StaticBody2D = $"."
@onready var health_point: ProgressBar = $ProgressBar

func _on_damage_taken(damage, attacker):
	health_point.value -= damage
	health_point.visible = true
	
	if health_point.value <= 0:
		tree.queue_free()
		attacker.add_wood()
