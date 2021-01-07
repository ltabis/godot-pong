extends Node
class_name GameLoop

var is_running = false

func _ready():
	for child in self.get_children():
		child.hide()
		child.set_process(false)
