extends Node
@export var wolf : 

var health: int = 3
var max_health: int = 100

func _input(event: InputEvent) -> void:
 
#Put a if here

		# Reduce health
		health = max(health - 1, 0)  # Ensures it doesn't go below 0
		print("Health:", health)

		# Check conditions
		if health <= 0:
			print("You died")
		elif health < max_health / 2:
			print("bof")
		else:
			print("ok")
