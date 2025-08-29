extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."

func _process(delta: float) -> void:
	var wood = control.player.get_child(0).wood
	label.text = str("wood : ", wood)

func _on_button_pressed() -> void:
	control.player.get_child(0).add_wood()

func _on_button_2_pressed() -> void:
	control.player.get_child(0).wood -= 1
	control.player.get_child(0).wood_display.text = str(control.player.get_child(0).wood)
