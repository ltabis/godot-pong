extends MenuButton

var difficulty = 0

func _ready():
	self.get_popup().connect("id_pressed", self, "_on_Difficulty_changed")

func _process(delta):
	pass

func _on_Difficulty_changed(difficulty):
	self.difficulty = difficulty
	self.text = str(IA.Difficulty.keys()[difficulty])

func get_difficulty():
	return IA.Difficulty.values()[difficulty] 
