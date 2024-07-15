extends Node


# Called when the node enters the scene tree for the first time.
var speed=20
var shootForce : float = 300.0
var rng = RandomNumberGenerator.new()
var time_elapsed = 0.0
var elevation=0.0
var jerrycan : PackedScene = preload("res://jerryCanResource.tscn")
var crystal1 : PackedScene = preload("res://crystal_1_resource.tscn")
var crystal2 : PackedScene = preload("res://crystal_2_resource.tscn")
@onready var itemTimer = $Timer

func _ready():
	itemTimer.timeout.connect(_spawnItem)
	itemTimer.wait_time = 3.0
	itemTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta
	#if not yet 200 seconds use the equation y=1/400x^2+20
	#if time_elapsed<200.0:
		#speed=time_elapsed*time_elapsed
		#speed/=400
		#speed+=20
	##after that constant
	#else:
		#speed=120	
	
	#-1/60 for speed calcs



func _spawnItem():
	itemTimer.stop()
	#spawn the enemy
	var coinflip = rng.randi_range(0, 2)
	if coinflip==0:
		var jerryInstance: RigidBody2D = jerrycan.instantiate()
		if jerryInstance != null:
			get_parent().add_child(jerryInstance)
			jerryInstance.position = Vector2(1000,300)
			var direction = Vector2(-.5,-.5)
			var initialVelocity = direction * shootForce
			jerryInstance.linear_velocity = initialVelocity
		print("spawned jerry can")
	elif coinflip ==1:
		var crystal1Instance: RigidBody2D = crystal1.instantiate()
		if crystal1Instance != null:
			get_parent().add_child(crystal1Instance)
			crystal1Instance.position = Vector2(1000,300)
			var direction = Vector2(-.5,-.5)
			var initialVelocity = direction * shootForce
			crystal1Instance.linear_velocity = initialVelocity
		print("spawned crystal 1")
	else:
		var crystal2Instance: RigidBody2D = crystal2.instantiate()
		if crystal2Instance != null:
			get_parent().add_child(crystal2Instance)
			crystal2Instance.position = Vector2(1000,300)
			var direction = Vector2(-.5,-.5)
			var initialVelocity = direction * shootForce
			crystal2Instance.linear_velocity = initialVelocity
		print("spawned crystal 2")
	var waitTime = rng.randf_range(3, 6)
	itemTimer.wait_time =waitTime-(speed/60)
	itemTimer.start()
	print("item: "+str(itemTimer.time_left))


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
