extends "res://scenes/plants/shootPlant/peashooter/Peashooter.gd"


const snow_path = preload("res://scenes/plants/projectiles/snowpea.tscn")

func shoot():
#	print('a')
	var snow = snow_path.instance()
	snow.position = $ProjectileSpawn.position
	add_child(snow)
