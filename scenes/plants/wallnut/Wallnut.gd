extends Plant

class_name Wallnut

onready var state_machine = $AnimationTree2.get("parameters/playback")

func _init().(10):
	pass
	
func _process(delta):
	if hp >= 3 && hp < 7:
		state_machine.travel("c1")
	if hp < 3:
		state_machine.travel("c2")
