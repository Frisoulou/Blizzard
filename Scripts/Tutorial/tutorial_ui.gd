extends Control

var current_slide : int = 0
@onready var story_label: Label = $StoryLabel
var transition_finished = true

@onready var timer: Timer = $PressAInstructionAppearTimer
@onready var press_a_intruction_label: Label = $PressAIntructionLabel

@onready var tutorial_2 = preload("res://Scenes/Tutorial/tutorial_2.tscn")

func _ready() -> void:
	press_a_intruction_label.modulate = Color.BLACK
	timer.start(1)

func _on_press_a_instruction_appear_timer_timeout() -> void:
	if current_slide == 0:
		reappear(press_a_intruction_label)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") and transition_finished:
		story_label.text = "You wake up in a wooden chalet"
		disappear(story_label)
	
	match current_slide:
		0:
			story_label.text = "You wake up in a wooden chalet"
		1:
			story_label.text = "It is cold outside..."
		2:
			story_label.text = "You walk to the door and open it"
		3:
			story_label.text = "A Blizzard came ! Everything is covered by snow"
		4:
			story_label.text = '"I really need to find a way out..."'
		5:
			get_tree().change_scene_to_packed(tutorial_2)

func disappear(label):
	transition_finished = false
	var tween = create_tween()
	tween.tween_property(
		label,
		"modulate",
		Color.BLACK,
		1
	)
	tween.play()
	tween.connect("finished", _on_disappear_finished)

func _on_disappear_finished():
	current_slide += 1
	reappear(story_label)

func reappear(label):
	var tween = create_tween()
	tween.tween_property(
		label,
		"modulate",
		Color.WHITE,
		1
	)
	tween.play()
	tween.connect("finished", _on_reappear_finished)

func _on_reappear_finished():
	transition_finished = true
