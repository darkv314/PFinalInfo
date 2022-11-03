extends KinematicBody2D

class_name projectile

func _on_Hitbox_area_entered(area):
	self.queue_free()
