extends Node


# Called when the node enters the scene tree for the first time.
var speed=20
var rng = RandomNumberGenerator.new()
var time_elapsed = 0.0
var elevation=0.0

@onready var rockTimer = $Timer
@onready var enemyTimer = $Timer
@onready var groundTimer = $Timer

func _ready():
	rockTimer.timeout.connect(_spawnRock)
	rockTimer.wait_time = 3.0
	enemyTimer.timeout.connect(_spawnEnemy)
	enemyTimer.wait_time = 3.0
	groundTimer.timeout.connect(_newGround)
	groundTimer.wait_time = 0.5
	groundTimer.start()
	rockTimer.start()
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
func _spawnRock():
	#spawn the rock
	rockTimer.stop()
	var waitTime = rng.randf_range(3, 6)
	rockTimer.wait_time =waitTime-(speed/60)
	rockTimer.start()
	print("rock: "+str(rockTimer.time_left))


func _spawnEnemy():
	#spawn the enemy
	enemyTimer.stop()
	var waitTime = rng.randf_range(3, 6)
	enemyTimer.wait_time =waitTime-(speed/60)
	enemyTimer.start()
	print("enemy: "+str(enemyTimer.time_left))


func _newGround():
	groundTimer.stop()
	#instantiate ground
	groundTimer.start()
