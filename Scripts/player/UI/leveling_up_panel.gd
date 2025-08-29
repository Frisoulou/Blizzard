extends Panel

@onready var leveling_up_panel: Panel = $"."
@export var player: CharacterBody2D
@onready var player_stats_manager = player.get_child(0)
@export var stats_debug_panel: Control

func _on_choosed_damage_pressed() -> void:
	leveling_up_panel.visible = false
	player_stats_manager.damage_point *= 1.15
	print(player_stats_manager.damage_point)
	if player_stats_manager.debug_mode:
		stats_debug_panel.visible = true

func _on_choosed_speed_pressed() -> void:
	leveling_up_panel.visible = false
	player_stats_manager.speed *= 1.20
	print(player_stats_manager.speed)
	if player_stats_manager.debug_mode:
		stats_debug_panel.visible = true
