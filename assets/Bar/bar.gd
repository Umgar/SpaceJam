extends Node2D

@export var pivot : Node2D
@export var filling : Sprite2D
@export var background : Sprite2D
@export var minVal : float = 200
@export var maxVal : float = 800
@export var player : Node2D
var preLoad = preload("res://scens/EndScreen.tscn")
var sizeP
var startPos
var unit : float
# Called when the node enters the scene tree for the first time.
func _ready():
	sizeP = filling.get_rect().size * filling.scale
	startPos = filling.position.x - (sizeP.x/2)
	unit = sizeP.x / (maxVal-minVal)
	print_debug(unit)

var speed=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if player != null:
		print_debug(player.Speed)
		speed = player.Speed - minVal
		
		
	if speed > (maxVal-minVal) or speed < 0:
		get_tree().change_scene_to_file("res://scens/EndScreen.tscn")
	pivot.position.x = startPos + (unit*speed)
	#print_debug(pivot.position.x)

