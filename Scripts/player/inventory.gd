extends Node

var wood: int = 0
@onready var wood_counter: Label = $"../WoodCounter"

func add_wood():
	wood += 1
	wood_counter.text = str(wood)
