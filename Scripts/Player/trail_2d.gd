extends Line2D

@export var lenght = 70
var point = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print_debug(points)
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	var offset = position.y

	add_point(point)
	while(get_point_count() > lenght):
		remove_point(0)
