extends Node2D
@export var playerNode : Node2D
@export var MinVal : int = 100 
@export var MaxVal : int = 300 
@export var textField : Label
@export var spriteImg : Sprite2D
@export var area : Node2D
var value
var minH
# Called when the node enters the scene tree for the first time.
func _ready():
	if MaxVal < MinVal:
		var z = MaxVal
		MaxVal = MinVal
		MinVal = z
	value = randi_range(MinVal, MaxVal)
	var newScale = randf_range(scale.x/2, scale.x)
	spriteImg.scale.x = newScale
	area.scale.x = newScale
	textField.text = str(value)
	minH = get_viewport_rect().size.y * 1.2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerNode != null:
		var velocity = Vector2(0, 1) * playerNode.Speed * delta
		position += velocity
	if position.y > minH:
		queue_free()
	
func SetPlayer(player: Node2D):
	playerNode = player
func SetNodePosition(newPos: Vector2):
	position = newPos

func _on_area_2d_body_entered(body : Node2D):
	body.Speed += value



func _on_area_2d_body_exited(body):
	queue_free()
