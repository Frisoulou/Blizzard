extends State

@export var rabbit: CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var meat_drop: Sprite2D = $"../../MeatDrop"
@onready var progress_bar: ProgressBar = $"../../ProgressBar"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var meat_area: CollisionShape2D = $"../../MeatDrop/Area2D/CollisionShape2D"

func Debug():
	print("Rabbit state : idle")
	pass

func Enter():
	print("Rabbit state : dead")
	rabbit.velocity = Vector2(0, 0)
	animated_sprite_2d.visible = false
	progress_bar.visible = false
	collision_shape_2d.disabled = true
	meat_drop.visible = true
	meat_area.disabled = false

func Update(delta: float):
		pass	
		
func Physics_update(delta: float):
		pass
