extends Area2D

@onready var screensize = get_viewport_rect().size

@export var speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.get_vector("left", "right", "up", "down")
	position += input * speed * delta
	position = position.clamp(Vector2.ZERO, screensize)
