extends ParallaxBackground

@export var scroll_speed : float = 1000
@export var player : Node2D = null
@export var camera : Node2D = null

var prev_offset

func _ready():
	prev_offset = scroll_offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player != null):
		scroll_speed = player.Speed
	scroll_offset.y = prev_offset.y + scroll_speed * delta
	prev_offset = scroll_offset
	
