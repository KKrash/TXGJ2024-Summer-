extends Node


# Called when the node enters the scene tree for the first time.
var speed=20
var shootForce : float = 100.0
var rng = RandomNumberGenerator.new()
var time_elapsed = 0.0
var elevation=0.0
var shooter : PackedScene = preload("res://Assets/Misc/prefabs/shooter.tscn")
var jumper : PackedScene = preload("res://Assets/Misc/prefabs/jumper.tscn")
@onready var enemyTimer = $Timer

func _ready():
	enemyTimer.timeout.connect(_spawnEnemy)
	enemyTimer.wait_time = 3.0
	enemyTimer.start()
	

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



func _spawnEnemy():
	enemyTimer.stop()
	#spawn the enemy
	var coinflip = rng.randi_range(0, 1)
	if coinflip==0:
		var jumpInstance: RigidBody2D = jumper.instantiate()
		if jumpInstance != null:
			get_parent().add_child(jumpInstance)
			jumpInstance.position = Vector2(1000,300)
			var direction = Vector2(-.5,-.5)
			var initialVelocity = direction * shootForce
			jumpInstance.linear_velocity = initialVelocity
		print("spawned jumper")
	else:
		var shootInstance: RigidBody2D = shooter.instantiate()
		if shootInstance != null:
			get_parent().add_child(shootInstance)
			shootInstance.position = Vector2(1000,300)
			var direction = Vector2(-.5,-.5)
			var initialVelocity = direction * shootForce
			shootInstance.linear_velocity = initialVelocity
		print("spawned shooter")
	var waitTime = rng.randf_range(3, 6)
	enemyTimer.wait_time =waitTime-(speed/60)
	enemyTimer.start()
	print("enemy: "+str(enemyTimer.time_left))


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
