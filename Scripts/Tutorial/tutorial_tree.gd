extends Area2D

@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label

func _on_body_entered(body: Node2D) -> void:
	panel.visible = true
	label.visible = true
	
func _on_body_exited(body: Node2D) -> void:
	panel.visible = false
	label.visible = false
