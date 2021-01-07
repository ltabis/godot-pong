extends Node
class_name GameLoop

var is_running = false

func _ready():
	set_game_state(false)

func _on_MainMenu_start(difficulty):
	$IA.difficulty = difficulty
	set_game_state(true)

func set_game_state(state):
	for child in self.get_children():
		child.show() if state else child.hide()
		child.set_process(state)
		is_running = state
