extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = "Score:" + str(GlobalVars.score)

