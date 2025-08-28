extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."

func _process(delta: float) -> void:
	var damage_point = control.player.get_child(0).damage_point
	label.text = str("damage : ", damage_point)

func _on_button_pressed() -> void:
	control.player.get_child(0).damage_point *= 1.1

func _on_button_2_pressed() -> void:
	control.player.get_child(0).damage_point *= 0.9
