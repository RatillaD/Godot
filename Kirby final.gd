extends KinematicBody2D
var Desplacament := Vector2.ZERO
var Moviment := Vector2. ZERO
var Gravetat := Vector2.DOWN * 500
var Velocitat := 400
var salt := 600
onready var kirby2 = $"."
onready var Anim_sprite = $AnimatedSprite2
onready var kirby =$".."
onready var Visible = kirby.comprova

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Visible = kirby.comprova
	
	if Visible == 1:
		get_node("Camera2D").current = true
		Moviment.x = 0
		if Input.is_action_pressed("dreta"):
			Desplacament += Vector2 (5,0)
			Anim_sprite.play("run ")
#			actualitza_direccio(velocity)
			
			
		if Input.is_action_pressed("esquerra"):
			Desplacament += Vector2 (-5,0)
			Anim_sprite.play("run ")
#			actualitza_direccio(velocity)

		if ((Input.is_action_pressed("amunt")) or ((Input.is_action_pressed("amunt")) and (Input.is_action_pressed("dreta"))) or ((Input.is_action_pressed("amunt")) and (Input.is_action_pressed("esquerra")))) and is_on_floor():
			Moviment.y = -salt
			Anim_sprite.play("salt")
				
				
		Moviment += Desplacament.normalized() * Velocitat
		Moviment += Gravetat * delta
	#	velocity = Moviment
		Moviment = move_and_slide(Moviment, Vector2.UP)
func actualitza_direccio (direction):
	Anim_sprite.flip_h= direction.x<0
