extends State

@onready var player: CharacterBody2D = $"../.."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var timer: Timer = $Timer
@onready var player_ui: CanvasLayer = $"../../Player_UI"


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
	player_ui.add_wood()
	Transitioned.emit(self, "Idle")
