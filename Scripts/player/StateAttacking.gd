extends State

@export var player : CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var timer: Timer = $Timer

func Exit():
	pass

func Enter():
	print("changed state : attack")
	animated_sprite_2d.play("Attack")
	
	if timer.is_stopped():
		timer.start()

func Update(delta: float):
	pass

func Physics_update(delta: float):
	pass
	
	

func _on_timer_timeout() -> void:
	Transitioned.emit(self, "Idle")
	
	if player.near:
		print("tree is destroyed")
