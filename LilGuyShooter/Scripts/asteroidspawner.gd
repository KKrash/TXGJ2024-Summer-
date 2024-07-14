extends Node
var groundPiece : PackedScene = preload("res://Assets/Misc/prefabs/groundpiece.tscn")
@onready var groundTimer = $Timer
var rng = RandomNumberGenerator.new()
var elevation=0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	groundTimer.timeout.connect(_newGround)
	groundTimer.wait_time = 0.63
	groundTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _newGround():
	#var targetPosition = position-Vector2(25,0)
	groundTimer.stop()
	var groundInstance: RigidBody2D = groundPiece.instantiate()
	if groundInstance != null:
		get_parent().add_child(groundInstance)
		groundInstance.position = Vector2(1000,-400+(elevation*80))
	var randomchangei=rng.randi_range(-1,1)
	var randomchange:float=randomchangei/10.0
	groundTimer.start()
