extends Node2D

func _process(_delta):
	if Input.is_key_pressed(KEY_F):
		$Window.show()
	if Input.is_key_pressed(KEY_G):
		$Window.hide()

func _on_window_close_requested():
	$Window.hide()
