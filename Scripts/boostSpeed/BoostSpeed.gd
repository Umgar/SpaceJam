extends Node2D
@export var speedToAdd = 200

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_area_2d_body_entered(body : Node2D):
	print_debug(body.Speed)
	body.Speed += speedToAdd
	print_debug(body.Speed)
