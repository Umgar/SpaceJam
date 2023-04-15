extends Camera2D

@export var Player : Node2D
var offFromPlayer : float

# Called when the node enters the scene tree for the first time.
func _ready():
	offFromPlayer = Player.position.y - position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = 0
	position.y = Player.position.y - offFromPlayer
