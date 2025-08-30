extends Control

@onready var label: Label = $Panel/Label
@onready var player_stats_manager: Node = $"../../PlayerStatsManager"
@onready var tutorial_rabbit: CharacterBody2D = $"../../../TutorialRabbit"
@onready var rabbit_running: Node = $"../../../TutorialRabbit/StateMachine/Running"
@onready var meat: Area2D = $"../../../TutorialRabbit/MeatDrop/Area2D"
@onready var tutorial_wolf: CharacterBody2D = $"../../../TutorialWolf"
@onready var player: CharacterBody2D = $"../.."
@onready var wolf_not_moving: Node = $"../../../TutorialWolf/StateMachine/NotMoving"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_stats_manager.wood == 1:
		label.text = "Good job !\nNow, put it in the fire to make you warm."
	if player_stats_manager.experience.value == 1 :
		label.text = "Using wood make you warmer.\nIt also increase your experience."
	if player_stats_manager.level == 1:
		self.visible = false
	if tutorial_rabbit.visible:
		self.visible = true
		label.text = "With time, you will also get hungry.\nTo eat, you'll need to find animals"
	if rabbit_running.rabbit_started_running:
		label.text = "Animals will flee if you get too close.\n Quick, catch up !"
	if meat.meat_has_been_picked_up:
		label.text = "You might also encouter dangerous animals..."
		_make_wolf_appear()
	
func _on_choosed_damage_pressed() -> void:
	tutorial_rabbit.visible = true

func _on_choosed_speed_pressed() -> void:
	tutorial_rabbit.visible = true

func _make_wolf_appear() -> void:
	if tutorial_wolf.visible == false :
		tutorial_wolf.visible = true
		tutorial_wolf.position = player.global_position - Vector2(100, -100)
		wolf_not_moving.exit_not_moving_state = true
		
