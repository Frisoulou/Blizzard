extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."


func _process(delta: float) -> void:
	var hungriness_speed = control.player.get_child(0).hungry_speed
	label.text = str("hungriness_speed : ", hungriness_speed)



func _on_button_pressed() -> void:
	control.player.get_child(0).hungry_speed *= 1.1
	control.player.get_child(0)._ready()
	


func _on_button_2_pressed() -> void:
	control.player.get_child(0).hungry_speed *= 0.9
	control.player.get_child(0)._ready()
