extends Area2D

@onready var screensize = get_viewport_rect().size
@export var speed = 150
@export var cooldown = 0.25
@export var bullet_scene : PackedScene
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var input = Input.get_vector("left", "right", "up", "down")
	if input.x > 0:
		$Ship.frame = 2
		$Ship/Boosters.play("right")
	elif input.x < 0:
		$Ship.frame = 0
		$Ship/Boosters.play("left")
	else:
		$Ship.frame = 1
		$Ship/Boosters.play("forward")
	position += input * speed * delta
	position.x = clamp(position.x, 8, screensize.x - 8)
	position.y = clamp(position.y, 8, screensize.y - 8)
