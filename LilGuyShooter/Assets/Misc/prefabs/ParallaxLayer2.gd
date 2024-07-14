extends ParallaxLayer
@export var speed: float =  -15

func _process(delta):
	self.motion_offset.x += speed*delta
