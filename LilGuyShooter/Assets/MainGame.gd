extends Node2D
var score

## Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	new_game()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func new_game():
	score = 0
	var Score_timer = get_node("Score Timer")
	Score_timer.timeout.connect(_on_score_timer_timeout())
	$Score_Timer.start()
	$HUD.update_score(score)
	
func game_over():
	$Score_Timer.stop()
	
func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)
