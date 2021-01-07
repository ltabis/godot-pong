extends Area2D

export var speed = 400
var screen_size

enum Difficulty { EASY, MEDIUM, HARD }
var difficulty = Difficulty.EASY

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	pass

func compute_easy_ia():
	pass

func compute_medium_ia():
	pass

func compute_hard_ia():
	pass

# external scripts can manipulate the ia difficulty
func set_difficulty(value):
	difficulty = value
