extends Control

@onready var main = preload("res://Scenes/main.tscn")

@onready var label: Label = $Panel/Label
@onready var player_stats_manager: Node = $"../../PlayerStatsManager"
@onready var tutorial_rabbit: CharacterBody2D = $"../../../TutorialRabbit"
@onready var rabbit_running: Node = $"../../../TutorialRabbit/StateMachine/Running"
@onready var meat: Area2D = $"../../../TutorialRabbit/MeatDrop/Area2D"
@onready var tutorial_wolf: CharacterBody2D = $"../../../TutorialWolf"
@onready var player: CharacterBody2D = $"../.."
@onready var wolf_not_moving: Node = $"../../../TutorialWolf/StateMachine/NotMoving"
@onready var wolf_meat: Area2D = $"../../../TutorialWolf/MeatDrop/Area2D"

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
		self.visible = true
		label.text = "Animals will flee if you get too close.\n Quick, catch up !"
	if meat.meat_has_been_picked_up:
		self.visible = true
		label.text = "You might also encouter dangerous animals...
					  With them, you might consider fleeing,
					  or fighting if you're brave"
		_make_wolf_appear()
		if (tutorial_wolf.global_position - player.global_position).length() > 300 \
		or wolf_meat.meat_has_been_picked_up == true :
			label.text = "Congratulation, you've finishied the tutorial ! \n
						  Press A to start the main game."
			if Input.is_action_just_pressed("action"):
				get_tree().change_scene_to_packed(main)
	
func _on_choosed_damage_pressed() -> void:
	tutorial_rabbit.visible = true

func _on_choosed_speed_pressed() -> void:
	tutorial_rabbit.visible = true

func _make_wolf_appear() -> void:
	if tutorial_wolf.visible == false :
		tutorial_wolf.visible = true
		tutorial_wolf.position = player.global_position - Vector2(100, -100)
		wolf_not_moving.exit_not_moving_state = true
		
