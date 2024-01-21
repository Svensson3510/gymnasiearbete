extends Control

func _on_play_pressed():
	$ButtonClick.play()
	get_tree().change_scene_to_file("res://Maps/The Farm.tscn")

func _on_quit_pressed():
	$ButtonClick.play()
	get_tree().quit()
