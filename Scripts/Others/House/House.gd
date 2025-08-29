extends Area2D

@onready var label: Label = $"../../House/HomeZone/Label"
@onready var panel: Panel = $"../../House/HomeZone/Panel"
var player_stats_manager : Node

func _on_body_entered(body: Node2D) -> void:
	panel.visible = true
	label.visible = true
	player_stats_manager = body.get_child(0)
	
func _on_body_exited(body: Node2D) -> void:
	panel.visible = false
	label.visible = false

func _process(delta: float) -> void:
	if label.visible == true :
		if Input.is_action_just_pressed("use_item"):
			player_stats_manager.use_wood()
