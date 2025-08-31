extends State
@onready var player: CharacterBody2D = $"../.."
@export var area_2d: Area2D
@onready var victory_screen: Control = $"../../Player_UI/Victory_screen"


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
	var village_center = area_2d.get_child(0).global_position
	var tween = create_tween()
	
	tween.tween_property(player, "position", village_center, 2)
	print("animation #1")
	tween.chain().tween_callback(func():
		print("animation #2")
		var tween2 = create_tween()
		var current_pos = player.global_position
		tween2.tween_property(player, "position", player.global_position + Vector2(100, 0), 2)
		)
	tween.chain().tween_callback(func():
		print("animation #3")
		var tween3 = create_tween()
		var current_pos = player.global_position
		tween3.tween_property(player, "position", player.global_position + Vector2(0, -30), .5)
		).set_delay(2)
	tween.chain().tween_callback(func():
		print("animation #4")
		var tween4 = create_tween()
		var current_pos = player.global_position
		tween4.tween_property(player, "position", player.global_position + Vector2(160, 0), 2.8)
		).set_delay(.4)
	victory_screen.visible = true
