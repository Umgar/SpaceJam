extends ParallaxLayer

var bgImage : Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	bgImage = self.get_child(0)
	motion_mirroring = (bgImage.get_rect().size) * bgImage.scale


