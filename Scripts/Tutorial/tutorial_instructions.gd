extends Control

@onready var label: Label = $Panel/Label
@onready var player_stats_manager: Node = $"../../PlayerStatsManager"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_stats_manager.wood == 1:
		label.text = "Good job !\nNow, put it in the fire to make you warm."
	if player_stats_manager.experience.value == 1 :
		label.text = "Using wood make you warmer.\nIt also increase your experience."
	if player_stats_manager.level == 1:
		self.visible = false
		
