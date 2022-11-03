extends Area2D

signal plant_entered

signal plant_exited

var zombies = 0
var plants = []
var cont = 0

func _process(delta):
	if cont > 0:
		for plant in plants:
			if plant.get_node('ShootTimer').is_stopped():
				plant.get_node('ShootTimer').start()

func _on_Square1_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square1_squareExited():
#	emit_signal("plant_exited")

func _on_Square2_squareEntered(pos):
#	print(plants.size())
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square2_squareExited():
#	emit_signal("plant_exited")

func _on_Square3_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square3_squareExited():
#	emit_signal("plant_exited")

func _on_Square4_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square4_squareExited():
#	emit_signal("plant_exited")

func _on_Square5_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square5_squareExited():
#	emit_signal("plant_exited")

func _on_Square6_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square6_squareExited():
#	emit_signal("plant_exited")

func _on_Square7_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square7_squareExited():
#	emit_signal("plant_exited")

func _on_Square8_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square8_squareExited():
#	emit_signal("plant_exited")

func _on_Square9_squareEntered(pos):
	emit_signal("plant_entered", Vector2(pos.x+position.x, position.y))

#func _on_Square9_squareExited():
#	emit_signal("plant_exited")


func _on_Row_body_entered(body):
#	print('zombie entered')
	cont += 1
#	print('Zombies inside: ', cont)


func _on_Row_body_exited(body):
#	print('zombie exited')
	cont -= 1
	if cont <= 0:
		for plant in plants:
			plant.get_node('ShootTimer').stop()
		


func _on_Map_planted():
	for plant in plants:
		plant.connect("died", self, "handle_plant_died")
		
func _on_plant_died(plant):
	var ind = plants.find(plant)
	plants.remove(ind)
