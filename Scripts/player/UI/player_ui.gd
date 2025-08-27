extends Node

@export var wood: int = 0
@onready var wood_display: Label = $Panel/WoodDisplay


func add_wood():
	wood += 1
	wood_display.text = str(wood)
