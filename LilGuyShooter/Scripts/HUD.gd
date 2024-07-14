extends CanvasLayer
signal start_game

func update_score(score):
	$ScoreLabel.text = str(score)
