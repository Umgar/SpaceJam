extends Node2D

@export var pivot : Node2D
@export var filling : Sprite2D
@export var background : Sprite2D
@export var minVal : float = 200
@export var maxVal : float = 800
@export var player : Node2D
@export var globalMusic : AudioStreamPlayer
@export var soundPlayer : AudioStreamPlayer2D
@export var timer : Timer
@export var Generator : Node2D
var preLoad = preload("res://scens/EndScreen.tscn")
var sizeP
var startPos
var unit : float
# Called when the node enters the scene tree for the first time.
func _ready():
	sizeP = filling.get_rect().size * filling.scale
	startPos = filling.position.x - (sizeP.x/2)
	unit = sizeP.x / (maxVal-minVal)


var speed=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.is_stopped():
		if player != null:
			speed = player.Speed - minVal
		if speed > (maxVal-minVal) or speed < 0:
			player.Speed = 0
			Generator.stop()
			timer.start()
			globalMusic.stop()
			soundPlayer.play()
			return

	pivot.position.x = startPos + (unit*speed)


func _on_timer():
	get_tree().change_scene_to_file("res://scens/EndScreen.tscn")
