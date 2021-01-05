extends Area2D

export var speed = 400
var screen_size
var direction = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	rotation = rand_range(PI / 2, -PI / 2)

func _process(delta):
	compute_velocity(delta)

func compute_direction():
	pass

func compute_velocity(delta):
	position += speed * delta

func _on_CollisionShape2D_tree_entered():
	compute_direction()