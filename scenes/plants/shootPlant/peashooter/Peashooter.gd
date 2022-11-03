extends ShootPlant

const pea_path = preload("res://scenes/plants/projectiles/pea.tscn")

func shoot():
#	print('a')
	var pea = pea_path.instance()
	pea.position = $ProjectileSpawn.position
	add_child(pea)

