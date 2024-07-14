extends CanvasLayer
signal start_game

#func ready():

#func _process(delta):
	#GlobalVars.fuelPercentage -= 1
	
func update_score(score):
	$ScoreLabel.text = str(score)
	$LivesLabel.text = str(GlobalVars.lives)
	#$Fuel.text = str(GlobalVars.fuelPercentage)+"%"


