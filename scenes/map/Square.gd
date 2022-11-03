extends Area2D

signal squareEntered
#signal squareExited

func _on_Square_area_entered(area):
	emit_signal("squareEntered", position)
	$Sprite.visible = true


func _on_Square_area_exited(area):
#	emit_signal("squareExited")
	$Sprite.visible = false
