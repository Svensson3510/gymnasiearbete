extends Area2D

func _on_body_entered(_body: CharacterBody2D):
	get_tree().change_scene_to_file("res://Maps/Level 1.tscn")
