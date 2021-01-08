extends Area2D
class_name Player

export var speed = 600
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	get_parent().connect("restart", self, "_on_Game_restart")

func _process(delta):
	compute_controlls(delta)

func compute_controlls(delta):

	var velocity = 0

	if Input.is_action_pressed("ui_down"):
		velocity += 1
	if Input.is_action_pressed("ui_up"):
		velocity -= 1

	position.y += velocity * speed * delta

	var collider = $CollisionShape2D.get_shape()

	# prevents the bar to go outside of the screen
	position.y = clamp(position.y, collider.extents.y, screen_size.y - collider.extents.y)

func _on_Game_restart():
	position = Vector2(position.x, screen_size.y / 2)
