extends State
@onready var player: CharacterBody2D = $"../.."
@onready var area_2d: Area2D = $Village/Area2D


func Debug():
	print("changed state : cinematic")

func Enter():
	pass

func Update(delta: float):
	player.velocity = Vector2.ZERO
	pass

func Physics_update(delta: float):
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var village_center = area_2d.position
	var tween = create_tween()
	
	tween.tween_property(player, "position", village_center, 10)
