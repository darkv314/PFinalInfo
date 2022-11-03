extends ShootPlant

const melon_path = preload("res://scenes/plants/projectiles/Melon.tscn")

func shoot():
	var melon = melon_path.instance()
	melon.position = $ProjectileSpawn.position
	add_child(melon)
	melon.launch(Vector2(300, -200))
