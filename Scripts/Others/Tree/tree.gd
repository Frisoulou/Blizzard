extends StaticBody2D

@onready var tree: StaticBody2D = $"."
@onready var health_point: ProgressBar = $ProgressBar
@onready var cutting_sound: AudioStreamPlayer2D = $cutting_sound
@onready var final_cut: AudioStreamPlayer2D = $final_cut

func _on_damage_taken(damage, attacker):
	health_point.value -= damage
	health_point.visible = true
	cutting_sound.play()
	
	if health_point.value <= 0:
		attacker.add_wood()

func _on_cutting_sound_finished() -> void:
	if health_point.value <= 0:
		var cut_sound = final_cut.duplicate()
		get_tree().current_scene.add_child(cut_sound)
		cut_sound.play()
		tree.queue_free()
