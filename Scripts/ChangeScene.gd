extends Node2D



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scens/level01.tscn")


func _on_Exit():
	get_tree().quit()
