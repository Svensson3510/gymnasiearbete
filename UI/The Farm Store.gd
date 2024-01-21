extends Node2D

func _process(_delta):
	if Input.is_key_pressed(KEY_S):
		$Window.show()
	if Input.is_key_pressed(KEY_E):
		$Window.hide()

func _on_window_close_requested():
	$Window.hide()
