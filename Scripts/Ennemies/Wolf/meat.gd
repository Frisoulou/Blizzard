extends Area2D

var player_stats_manager : Node
@onready var wolf: CharacterBody2D = $"../.."
var meat_has_been_picked_up = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		player_stats_manager = body.get_child(0)
		player_stats_manager.hungriness.value += 15
		wolf.visible = false
		meat_has_been_picked_up = true
	
	#wolf.queue_free()
