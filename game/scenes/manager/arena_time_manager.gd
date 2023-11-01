extends Node

# Assign node to variable when it becomes ready
@onready var timer = $Timer

func get_time_elapsed():
	return timer.wait_time - timer.time_left
