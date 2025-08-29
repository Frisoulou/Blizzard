extends Area2D

var player_stats_manager : Node
@onready var rabbit: CharacterBody2D = $"../.."

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		player_stats_manager = body.get_child(0)
		player_stats_manager.hungriness.value += 15
		rabbit.queue_free()
