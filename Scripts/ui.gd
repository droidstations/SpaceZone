extends MarginContainer

@onready var shield_bar = $HBoxContainer/ShieldBar
@onready var score_counter = $HBoxContainer/ScoreCounter

func update_score(value):
	score_counter.display_digits(value)
	
func update_shield(max_value, value):
	shield_bar.max_value = max_value
	shield_bar.value = value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
