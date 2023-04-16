extends Line2D

@export var lenght = 20
var point = Vector2()
var startPoint : Vector2

func _ready():
	startPoint = global_position - get_parent().global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print_debug(points)
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	point += startPoint
	for i in range(0, get_point_count()):
		var newPos = Vector2(points[i].x, points[i].y+4)
		remove_point(i)
		add_point(newPos, i)
	add_point(point)
	while(get_point_count() > lenght):
		remove_point(0)

