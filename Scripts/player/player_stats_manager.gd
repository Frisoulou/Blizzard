extends Node

#This script will keep track of the player statistics
@export var debug_mode = false
@onready var stats_debug_panel: Control = $"../Player_UI/StatsDebugPanel"

@export var speed = 300.0
@export var damage_point : float = 1

#Timer are use to slowly decrement coldness and hungriness
@onready var cold_timer: Timer = $ColdTimer
@onready var hungry_timer: Timer = $HungryTimer

func _ready() -> void:
	cold_timer.start(cold_speed)
	hungry_timer.start(hungry_speed)


#######################
###Managing coldness###
#######################
@export var cold_speed: float = 1
@onready var coldness: ProgressBar = $"../Player_UI/Panel/Coldness"

func _on_cold_timer_timeout() -> void:
	coldness.value -= 1


#######################
###Managing coldness###
#######################
@export var hungry_speed: float = 3
@onready var hungriness: ProgressBar = $"../Player_UI/Panel/Hungriness"

func _on_hungry_timer_timeout() -> void:
	hungriness.value -= 1


#########################################
###Managing experience and leveling up###
#########################################
@onready var experience: ProgressBar = $"../Player_UI/Panel/Experience"
@onready var experience_label: Label = $"../Player_UI/Panel/Experience/ExperienceLabel"
@onready var leveling_up_panel: Panel = $"../Player_UI/LevelingUpPanel"

var level: int = 0

func _on_experience_get(amount):
	experience.value += amount
	if experience.value >= experience.max_value:
		level += 1
		stats_debug_panel.visible = false
		leveling_up_panel.visible = true
		experience.value = 0
		experience.max_value *= 1.25
		experience_label.text = str("Level : ", level)

#######################
###Managing wood    ###
#######################
@export var wood: int = 0
@onready var wood_display: Label = $"../Player_UI/Panel/WoodDisplay"

func add_wood():
	wood += 1
	wood_display.text = str(wood)

func use_wood():
	if wood > 0:
		wood -= 1
		wood_display.text = str(wood)
		coldness.value += 10
		_on_experience_get(1)

#######################
###Managing health  ###
#######################
var health : int = 3
@onready var game_over_screen: CanvasLayer = $"../Game_over_screen"
@onready var hit_sound: AudioStreamPlayer2D = $Hit_sound
@onready var heart_1: TextureRect = $"../Player_UI/Panel/Health/Heart1"
@onready var heart_2: TextureRect = $"../Player_UI/Panel/Health/Heart2"
@onready var heart_3: TextureRect = $"../Player_UI/Panel/Health/Heart3"

func _on_damage_taken():
	health = max(health -1, 0)
	hit_sound.play()
	match health:
		3:
			heart_1.visible = true
			heart_2.visible = true
			heart_3.visible = true
		2:
			heart_1.visible = true
			heart_2.visible = true
			heart_3.visible = false
		1:
			heart_1.visible = true
			heart_2.visible = false
			heart_3.visible = false
		0:
			heart_1.visible = false
			heart_2.visible = false
			heart_3.visible = false

	if health == 0:
		game_over_screen.game_over()


func _process(delta: float) -> void:
	if coldness.value == 0:
		game_over_screen.game_over()
	if hungriness.value == 0:
		game_over_screen.game_over()

#######################
###Debug mode       ###
#######################

func _on_degug_button_pressed() -> void:
	if stats_debug_panel.visible:
		stats_debug_panel.visible = false
	else:
		stats_debug_panel.visible = true
