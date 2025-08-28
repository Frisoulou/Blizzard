extends Node

@export var animated_sprite_2d: AnimatedSprite2D
@onready var hp_bar: Label = $"../Player_UI/HP_bar"

var health: int = 3
var max_health: int = 3

func _process(delta: float) -> void:
	if animated_sprite_2d.animation == "Attacking":
		health = max(health -1, 0)
		hp_bar.text = str(health, "/", max_health)
#Put a if here

		## Reduce health
		#health = max(health - 1, 0)  # Ensures it doesn't go below 0
		#print("Health:", health)
#
		## Check conditions
		#if health <= 0:
			#print("You died")
		#elif health < max_health / 2:
			#print("bof")
		#else:
			#print("ok")
