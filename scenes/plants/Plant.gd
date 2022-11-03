extends StaticBody2D

class_name Plant

signal is_planted
signal died

var hp: int
var entered = false
var last_mouse_pos = null
var first_click = false
var is_clicked = false

func _input(event):
	if entered:
		if event.is_action_pressed("click"):
			first_click = false
#	else:
#		if first_click && event.is_action_pressed("click"):
#			first_click = false
#
#			var newPos = get_tree().get_root().get_node('Map').posPlant
#			print(newPos, ' nuevo pos')
#			position = newPos

func _init(new_hp := 6):
	hp = new_hp
	
func die():
	$Sprite.visible=false
	$Damage.stop()
	emit_signal("died", self)
	self.queue_free()

func receive_dmg():
	pass
	

func _process(delta):
	if first_click:
		position = get_viewport().get_mouse_position()
	else:
		if !is_clicked:
			var newP = get_tree().get_root().get_node('Map').posPlant
#			print(newP)
			if newP == Vector2.ZERO:
				first_click = true
			else:
				position = newP
				is_clicked = true
				emit_signal("is_planted", position.y)


func _on_Plant_mouse_entered():
	entered = true

func _on_Plant_mouse_exited():
	entered = false;


func _on_Hurtbox_area_entered(area):
	$Damage.start()
	

func _on_Damage_timeout():
	hp-=1
	if hp <= 0:
		die()



func _on_Hurtbox_area_exited(area):
	$Damage.stop()
