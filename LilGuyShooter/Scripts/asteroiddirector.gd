extends Node


# Called when the node enters the scene tree for the first time.
var speed=20
var shootForce : float = 100.0
var rng = RandomNumberGenerator.new()
var time_elapsed = 0.0
var elevation=0.0
var asteroid : PackedScene = preload("res://Assets/Misc/prefabs/asteroid.tscn")
@onready var rockTimer = $Timer

func _ready():
	rockTimer.timeout.connect(_spawnRock)
	rockTimer.wait_time = 3.0
	rockTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	#if not yet 200 seconds use the equation y=1/400x^2+20
	if time_elapsed<200.0:
		speed=time_elapsed*time_elapsed
		speed/=400
		speed+=20
	#after that constant
	else:
		speed=120	
	
	#-1/60 for speed calcs
func _spawnRock():
	#spawn the rock
	rockTimer.stop()
	var rockInstance: RigidBody2D = asteroid.instantiate()
	var posplus = rng.randi_range(-100, 150)
	if rockInstance != null:
		get_parent().add_child(rockInstance)
		rockInstance.position = Vector2(1000,100+posplus)
		print("spawned rock")
	var waitTime = rng.randf_range(3, 6)
	rockTimer.wait_time =waitTime-(speed/60)
	rockTimer.start()
	print("rock: "+str(rockTimer.time_left))



func _newGround():
	#var targetPosition = position-Vector2(25,0)
	#groundTimer.stop()
	#var groundInstance: RigidBody2D = groundPiece.instantiate()
	#if groundInstance != null:
		#get_parent().add_child(groundInstance)
		#groundInstance.position = Vector2(1000,400)
	#var randomchangei=rng.randi_range(-1,1)
	#var randomchange:float=randomchangei/10.0
	#elevation+=randomchange
	#groundTimer.start()
	pass
