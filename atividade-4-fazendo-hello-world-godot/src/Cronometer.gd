extends Label

var time = 0

func _physics_process(delta):
	time += delta
	text = str(time)
