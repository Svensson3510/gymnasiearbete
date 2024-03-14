extends Control

func _on_button_pressed():
	$ButtonClick.play()
	get_tree().change_scene_to_file("res://UI/Start Menu.tscn")
