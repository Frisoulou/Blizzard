extends Label

@onready var control: Control = $"../.."
@onready var label: Label = $"."

func _process(delta: float) -> void:
	var hungriness = control.player.get_child(0).hungriness.value
	label.text = str("hungriness : ", hungriness)

func _on_button_pressed() -> void:
	control.player.get_child(0).hungriness.value += 10

func _on_button_2_pressed() -> void:
	control.player.get_child(0).hungriness.value -= 10
