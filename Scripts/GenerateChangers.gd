extends Node2D

const addingBar = preload("res://assets/ChangeSpeed/speedAdd.tscn")
const delBar = preload("res://assets/ChangeSpeed/speedDel.tscn")
@export var player : Node2D
@export var minTimer = 0.2
@export var maxTimer = 1.5
var addingChange = 0.5
var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_timer_timeout():
	self.get_child(0).wait_time = randf_range(minTimer, maxTimer)
	var createdNode
	var xPos = randf_range(-(screenSize.x/2), (screenSize.x/2))
	var yPos = -randf_range(screenSize.y, screenSize.y*1.5)
	if randf_range(0, 1) < addingChange:
		createdNode = addingBar.instantiate()
	else: createdNode = delBar.instantiate()
	createdNode.SetPlayer(player)
	self.add_child(createdNode)
	createdNode.SetNodePosition(Vector2(xPos, yPos))
