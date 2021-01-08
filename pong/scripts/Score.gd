extends Label

var score = 0

func increase_score():
	score += 1

func update_ui():
	self.text = str(score)

func get_score():
	return score
