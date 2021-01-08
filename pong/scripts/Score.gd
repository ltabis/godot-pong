extends Label
class_name Score

var score = 0
var player = GameLoop.Players.PLAYER1

func _ready():
	self.connect("start", self, "_on_Game_start")

func increase_score():
	score += 1

func update_ui():
	self.text = str(score)

func get_score():
	return score

func _on_Game_start():
	score = 0
