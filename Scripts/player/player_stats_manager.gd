extends Node

#This script will keep track of the player statistics

#Timer are use to slowly decrement coldness and hungriness
@onready var cold_timer: Timer = $ColdTimer
@onready var hungry_timer: Timer = $HungryTimer

func _ready() -> void:
	cold_timer.start(cold_speed)
	hungry_timer.start(hungry_speed)
	
#######################
###Managing coldness###
#######################
@export var cold_speed: int = 1
@onready var coldness: ProgressBar = $"../Player_UI/Panel/Coldness"

func _on_cold_timer_timeout() -> void:
	coldness.value -= 1

#######################
###Managing coldness###
#######################
@export var hungry_speed: int = 3
@onready var hungriness: ProgressBar = $"../Player_UI/Panel/Hungriness"

func _on_hungry_timer_timeout() -> void:
	hungriness.value -= 1

#######################
###Managing wood    ###
#######################
@export var wood: int = 0
@onready var wood_display: Label = $"../Player_UI/Panel/WoodDisplay"

func add_wood():
	wood += 1
	wood_display.text = str(wood)
