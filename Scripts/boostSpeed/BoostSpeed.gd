extends Node2D
@export var playerNode : Node2D
@export var MinVal : int = 100 
@export var MaxVal : int = 300 
@export var textField : Label

var value
# Called when the node enters the scene tree for the first time.
func _ready():
	if MaxVal < MinVal:
		var z = MaxVal
		MaxVal = MinVal
		MinVal = MaxVal
	value = randi_range(MinVal, MaxVal)
	var newScale = randf_range(scale.x/2, scale.x)
	scale.x = newScale
	textField.text = str(value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerNode != null:
		var velocity = Vector2(0, 1) * playerNode.Speed * delta
		position += velocity
	
func SetPlayer(player: Node2D):
	playerNode = player
func SetNodePosition(newPos: Vector2):
	position = newPos

func _on_area_2d_body_entered(body : Node2D):
	print_debug(body.Speed)
	body.Speed += value
	print_debug(body.Speed)
