extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."

func _process(delta: float) -> void:
	var coldness = control.player.get_child(0).coldness.value
	label.text = str("coldness : ", coldness)

func _on_button_pressed() -> void:
	control.player.get_child(0).coldness.value += 10

func _on_button_2_pressed() -> void:
	control.player.get_child(0).coldness.value -= 10
