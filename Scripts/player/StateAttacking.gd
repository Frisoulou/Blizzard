extends State


@onready var player: CharacterBody2D = $"../.."
@onready var timer: Timer = $Timer
@onready var player_ui: CanvasLayer = $"../../Player_UI"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../Marker2D/AnimatedSprite2D"
@onready var axe_collision_2d: CollisionShape2D = $"../../Marker2D/Area2D/AxeCollision2D"
@onready var state_machine: Node = $".."
@onready var player_stats_manager: Node = $"../../PlayerStatsManager"

var tree_is_near = false
var nearest_tree = Node2D

func Debug():
	print("changed state : attack")

func Enter():
	animated_sprite_2d.play("Attack")
	
	if tree_is_near and nearest_tree and nearest_tree is Node2D:
		if nearest_tree.is_in_group("Tree"):
			nearest_tree._on_damage_taken(player_stats_manager.damage_point, player_stats_manager)
	if timer.is_stopped():
		timer.start()

func Update(delta: float):
	pass

func Physics_update(delta: float):
	pass

func _on_timer_timeout() -> void:
	Transitioned.emit(self, "Idle")

func _on_area_2d_body_entered(body: Node2D) -> void:
	tree_is_near = true
	nearest_tree = body
func _on_area_2d_body_exited(body: Node2D) -> void:
	tree_is_near = false
