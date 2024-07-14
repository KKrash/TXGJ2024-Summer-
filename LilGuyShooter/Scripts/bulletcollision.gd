extends Area2D
var explosionScene : PackedScene = preload("res://Assets/Misc/Projectiles/ExplosionEnemy.tscn")
func _physics_process(delta):
	pass	

#func body_entered (body):
	#print("BULLETHIT")
	#if body.has_method("hit"):
		#body.hit()
	#queue_free() 
	
	
func _on_body_entered(body):
	print("BULLETHIT")
	if body.has_method("hit"):
		body.hit()
	queue_free() 
