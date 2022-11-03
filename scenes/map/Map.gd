extends Node2D

signal planted
var zombie_generation = RandomNumberGenerator.new()
const zombie1_path = preload("res://scenes/zombies/common/CommonZombie.tscn")
const zombie2_path = preload("res://scenes/zombies/cono/ZombieCono.tscn")
const zombie3_path = preload("res://scenes/zombies/cubo/ZombieCubo.tscn")
const zombie4_path = preload("res://scenes/zombies/football/ZombieFootlball.tscn")
const zombie5_path = preload("res://scenes/zombies/puerta/ZombiePuerta.tscn")
const pea_path = preload("res://scenes/plants/shootPlant/peashooter/Peashooter.tscn")
const sun_path = preload("res://scenes/plants/sunflower/Sunflower.tscn")
const melon_path = preload("res://scenes/plants/shootPlant/melonpult/Melonpult.tscn")
const wall_path = preload("res://scenes/plants/wallnut/Wallnut.tscn")
const rep_path = preload("res://scenes/plants/shootPlant/repeater/Repeater.tscn")
const snow_path = preload("res://scenes/plants/shootPlant/snowpea/SnowPea.tscn")
var entered_p = false
var entered_s = false
var entered_m = false
var entered_w = false
var entered_sn = false
var entered_r = false
var plantList = []
var attackList = []
var zombieList = []
var zombies = []
var posPlant = Vector2.ZERO
var plant
onready var loose = $loose
#onready var resume = $resume
#onready var quit = $quit
#onready var play = $play
onready var win = $win


func _ready():
	zombies.append(zombie1_path.instance())
	zombies.append(zombie1_path.instance())
	zombies.append(zombie1_path.instance())
	zombies.append(zombie1_path.instance())
	zombies.append(zombie1_path.instance())
	zombies.append(zombie3_path.instance())
	zombies.append(zombie1_path.instance())
	zombies.append(zombie2_path.instance())
	zombies.append(zombie3_path.instance())
	zombies.append(zombie4_path.instance())
	zombies.append(zombie5_path.instance())
	zombies.append(zombie3_path.instance())
	loose.hide()
#	resume.hide()
#	quit.hide()
#	play.hide()
	win.hide()

func _process(delta):
	for z in zombieList:
		if (z.is_done_dying):
			zombieList.remove(zombieList.find(z))
		if(z.position.x <= 350):
			loose.show()
			get_tree().paused = true

	if len(zombieList) == 0 and len(zombies) == 0:
		win.show()
		get_tree().paused = true



func _on_ZombieGeneration_timeout():
	zombie_generation = int(rand_range(0, 4))
	if(zombie_generation == 0 and len(zombies) != 0):
		var zombie = zombies[0]
		zombies.remove(0)
		zombie.position = get_node("PZ1").position
#		print(zombie)
		add_child(zombie)
		zombieList.append(zombie)
	if(zombie_generation == 1 and len(zombies) != 0):
		var zombie = zombies[0]
		zombies.remove(0)
		zombie.position = get_node("PZ2").position
		add_child(zombie)
		zombieList.append(zombie)
	if(zombie_generation == 2 and len(zombies) != 0):
		var zombie = zombies[0]
		zombies.remove(0)
		zombie.position = get_node("PZ3").position
		add_child(zombie)
		zombieList.append(zombie)
	if(zombie_generation == 3 and len(zombies) != 0):
		var zombie = zombies[0]
		zombies.remove(0)
		zombie.position = get_node("PZ4").position
		add_child(zombie)
		zombieList.append(zombie)
	if(zombie_generation == 4 and len(zombies) != 0):
		var zombie = zombies[0]
		zombies.remove(0)
		zombie.position = get_node("PZ5").position
		add_child(zombie)
		zombieList.append(zombie)
		
func handle_is_planted(pos):
	if pos == 270:
		$Row1.plants.append(plant)
	if pos == 380:
		$Row2.plants.append(plant)
	if pos == 480:
		$Row3.plants.append(plant)
	if pos == 580:
		$Row4.plants.append(plant)
	if pos == 680:
		$Row5.plants.append(plant)

	
func _input(event):
	if event.is_action_pressed("click"):
		if entered_m and int($Sunlabel.text) >= 350:
			attackList.append(melon_path.instance())
			var melon = attackList[attackList.size()-1]
			melon.position = get_viewport().get_mouse_position()
			melon.first_click = true
			add_child(melon)
			$Sunlabel.text = str(int($Sunlabel.text) - 350)
			plant = melon
			plant.connect("is_planted", self, "handle_is_planted")
		if entered_p and int($Sunlabel.text) >= 100:
			attackList.append(pea_path.instance())
			var pea = attackList[attackList.size()-1]
			pea.position = get_viewport().get_mouse_position()
			pea.first_click = true
			add_child(pea)
			$Sunlabel.text = str(int($Sunlabel.text) - 100)
			plant = pea
			plant.connect("is_planted", self, "handle_is_planted")
		if entered_s and int($Sunlabel.text) >= 50:
			plantList.append(sun_path.instance())
			var sunf = plantList[plantList.size()-1]
			sunf.position = get_viewport().get_mouse_position()
			sunf.first_click = true
			add_child(sunf)
			$Sunlabel.text = str(int($Sunlabel.text) - 50)
		if entered_w and int($Sunlabel.text) >= 50:
			plantList.append(wall_path.instance())
			var wall = plantList[plantList.size()-1]
			wall.position = get_viewport().get_mouse_position()
			wall.first_click = true
			add_child(wall)
			$Sunlabel.text = str(int($Sunlabel.text) - 50)
		if entered_r and int($Sunlabel.text) >= 200:
			plantList.append(rep_path.instance())
			var rep = plantList[plantList.size()-1]
			rep.position = get_viewport().get_mouse_position()
			rep.first_click = true
			add_child(rep)
			$Sunlabel.text = str(int($Sunlabel.text) - 200)
			plant = rep
			plant.connect("is_planted", self, "handle_is_planted")
		if entered_sn and int($Sunlabel.text) >= 175:
			plantList.append(snow_path.instance())
			var snow = plantList[plantList.size()-1]
			snow.position = get_viewport().get_mouse_position()
			snow.first_click = true
			add_child(snow)
			$Sunlabel.text = str(int($Sunlabel.text) - 200)
			plant = snow
			plant.connect("is_planted", self, "handle_is_planted")

func _on_quit_button_down():
	get_tree().quit()

func _on_Row1_plant_entered(pos):
	posPlant = pos


func _on_Row2_plant_entered(pos):
	posPlant = pos

func _on_Row3_plant_entered(pos):
	posPlant = pos

func _on_Row4_plant_entered(pos):
	posPlant = pos

func _on_Row5_plant_entered(pos):
	posPlant = pos

func _on_Peacard_mouse_entered():
	entered_p = true

func _on_Peacard_mouse_exited():
	entered_p = false

func _on_Suncard_mouse_entered():
	entered_s = true
	
func _on_Suncard_mouse_exited():
	entered_s = false

func _on_Meloncard_mouse_entered():
	entered_m = true

func _on_Meloncard_mouse_exited():
	entered_m = false

func _on_Wallcard_mouse_entered():
	entered_w = true

func _on_Wallcard_mouse_exited():
	entered_w = false
	
func _on_Snowcard_mouse_entered():
	entered_sn = true

func _on_Snowcard_mouse_exited():
	entered_sn = false
	
func _on_Repcard_mouse_entered():
	entered_r = true

func _on_Repcard_mouse_exited():
	entered_r = false
