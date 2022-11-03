extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var entered = false
var sun = 50

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("click") and entered:
		var amount = int(get_tree().get_root().get_node('Map').get_node("Sunlabel").text)
		get_tree().get_root().get_node('Map').get_node("Sunlabel").text = str(amount + sun)
		self.queue_free()
		

func _on_KinematicBody2D_mouse_entered():
	entered = true


func _on_KinematicBody2D_mouse_exited():
	entered = false
