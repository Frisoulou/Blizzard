extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."


func _process(delta: float) -> void:
	var cold_speed = control.player.get_child(0).cold_speed
	label.text = str("cold speed : ", cold_speed)



func _on_button_pressed() -> void:
	control.player.get_child(0).cold_speed *= 1.1
	control.player.get_child(0)._ready()
	


func _on_button_2_pressed() -> void:
	control.player.get_child(0).cold_speed *= 0.9
	control.player.get_child(0)._ready()
