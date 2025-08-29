extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."

func _process(delta: float) -> void:
	var level = control.player.get_child(0).level
	label.text = str("level : ", level)

func _on_button_pressed() -> void:
	control.player.get_child(0)._on_experience_get(control.player.get_child(0).experience.max_value)

func _on_button_2_pressed() -> void:
		pass
