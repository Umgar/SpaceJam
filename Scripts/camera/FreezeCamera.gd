extends Camera2D

@export var Player : Node2D
var offFromPlayer : float

# Called when the node enters the scene tree for the first time.
func _ready():
	offFromPlayer = Player.position.y - position.y
	var screenSize = get_viewport_rect().size
	limit_left = -(screenSize.x/2)
	limit_right = screenSize.x/2
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = 0
	position.y = Player.position.y - offFromPlayer
