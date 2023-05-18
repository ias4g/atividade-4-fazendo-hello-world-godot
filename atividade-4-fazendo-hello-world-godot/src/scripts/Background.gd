extends ColorRect

export (int) var velocity

var width = 0
var height = 0
var space = false

func _process(delta: float) -> void:
	
	getDimension()
	
	var right = 0
	var left = 0
	var up = 0
	var down = 0
	
	if Input.get_action_strength("ui_right"):
		right = 1
		$Label.text = "Right"
		self.color = Color(255, 0, 0, 1)
		pass
	
	if Input.get_action_strength("ui_left"):
		left = -1
		$Label.text = "Left"
		self.color = Color(0, 0, 0, 1)
		pass
	
	if Input.get_action_strength("ui_up"):
		up = -1
		$Label.text = "Up"
		self.color = Color(0, 0, 255, 1)
		pass
	
	if Input.get_action_strength("ui_down"):
		down = 1
		$Label.text = "Down"
		self.color = Color(255, 0, 255, 1)
		pass
	
	if get_position().x > (width - 120):
		right = 0
		pass
	
	if get_position().x <= 20:
		left = 0
		pass
	
	if get_position().y > (height - 120):
		down = 0
		pass
	
	if get_position().y <= 20:
		up = 0
		pass
	
	var x = velocity * delta * (right + left)
	var y = velocity * delta * (up + down)
	
	set_position(get_position() + Vector2(x, y))
	
	pass

func getDimension() -> void:
	width = self.get_parent().get_parent_area_size().x
	height = self.get_parent().get_parent_area_size().y
	pass
