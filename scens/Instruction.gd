extends Sprite2D

var timeV = 0
func _process(delta):
	timeV += delta * 6
	modulate.a = cos(timeV)


func _on_timer_timeout():
	queue_free()
