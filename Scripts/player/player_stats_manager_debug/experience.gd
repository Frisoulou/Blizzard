extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."


func _process(delta: float) -> void:
	var experience = control.player.get_child(0).experience
	label.text = str("experience : ", experience.value)



func _on_button_pressed() -> void:
	control.player.get_child(0)._on_experience_get(10)

func _on_button_2_pressed() -> void:
	control.player.get_child(0).experience.value = 0
