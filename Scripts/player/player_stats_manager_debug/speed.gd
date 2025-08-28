extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."

func _process(delta: float) -> void:
	var speed = control.player.get_child(0).speed
	label.text = str("speed : ", speed)

func _on_button_pressed() -> void:
	control.player.get_child(0).speed *= 1.1

func _on_button_2_pressed() -> void:
	control.player.get_child(0).speed *= 0.9
