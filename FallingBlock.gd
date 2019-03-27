extends "res://Level/Blocks/Block/Block.gd"

class_name FallingBlock


export (int) var max_touches = 2
var numbers_touched = 0

var is_falling : bool = false
var gravity = 1100
var velocity = 0


func _process(delta):
  if is_falling:
    velocity += gravity * delta
    global_translate(Vector2(0, velocity) * delta)
  
	
func fall() -> void:
  print('fallling')
  $Tween.interpolate_property(self, 'global_rotation',
    global_rotation, 0, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
    
  $Tween.interpolate_property(self, 'modulate',
    modulate, modulate - Color(0, 0, 0, 1), 1, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
  
  is_falling = true
  

# Called in reaction to contact with the ball.
func contact() -> void:
	.contact()
	
	numbers_touched += 1
	if numbers_touched >= max_touches:
		fall()