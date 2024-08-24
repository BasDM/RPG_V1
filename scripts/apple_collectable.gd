extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	fallfromtree()
	
func fallfromtree():
	$AnimationPlayer.play("fallingFromTree")
	await get_tree().create_timer(1.5).timeout
	
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(0.3).timeout
	
	#poof gone
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
