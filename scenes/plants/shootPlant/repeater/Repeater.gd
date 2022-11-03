extends "res://scenes/plants/shootPlant/peashooter/Peashooter.gd"

var secShoot = false

func shoot():
	var pea = pea_path.instance()
	pea.position = $ProjectileSpawn.position
	add_child(pea)
	if !secShoot:
		$SecondShoot.start()
	else:
		secShoot = false
		$SecondShoot.stop()



func _on_SecondShoot_timeout():
	secShoot = true
	shoot()
