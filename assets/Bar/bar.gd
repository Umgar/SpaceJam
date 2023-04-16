extends Node2D

@export var pivot : Node2D
@export var filling : Sprite2D
@export var background : Sprite2D
@export var minVal : float = 200
@export var maxVal : float = 800
@export var player : Node2D
var sizeP
var startPos
var unit
# Called when the node enters the scene tree for the first time.
func _ready():
	sizeP = filling.get_rect().size * filling.scale
	startPos = filling.position.x - (sizeP.x/2)
	unit =sizeP.x / (minVal+maxVal)

var speed = 400
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if player != null:
		speed = player.Speed
		if speed > maxVal or speed < minVal:
			print_debug("KONIEC!")
			free()
			return
	pivot.position.x = startPos + (unit*speed)

