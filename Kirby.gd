extends KinematicBody2D

var velocitat := 400
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN * 1200
var desplacament := Vector2.ZERO
var salt := 1000
onready var animatedSprite = $AnimatedSprite
onready var Anim_Sprite = $AnimatedSprite2
var morint = false
var soroll_salt = false
var soroll_frames = 0
onready var kirby =$"."
var Visible = visible
var comprova = 0
onready var nubol = $"../Area2D25"
onready var musica_fons =$"../musica"

var Desplacament := Vector2.ZERO
var Moviment := Vector2. ZERO
var Gravetat := Vector2.DOWN * 1400
var Velocitat := 1050
var Salt := 1700
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func kirby_saltar():
	animatedSprite.play ("puja")
	
	
func kirby_caure():
	animatedSprite.play ("cau")
	
func escenari_general_abans247(delta):
	Anim_Sprite.visible = false
	
	if(get_slide_collision(get_slide_count()-1) == null):
		morint = false
		moviment.x = 800
		desplacament.y = 0
	
		if Input.is_action_pressed("ves_adalt"):
			if soroll_salt == false:
				get_node("salt").play()
				soroll_salt = true
				soroll_frames = 10
				
			moviment.y = -salt
			kirby_saltar()
				
		else:
			if soroll_salt == true:
				if soroll_frames > 0:
					soroll_frames -= 1
				else:
					get_node("salt").stop()
					soroll_salt = false
			kirby_caure()
		moviment += gravetat * delta
		moviment += desplacament.normalized() * velocitat
		moviment = move_and_slide(moviment, Vector2.UP) 
	else:
		
		if morint == false:
			get_node("salt").stop()
			animatedSprite.play("mort final")
			
			moviment.x = 0
			moviment.y = 0
			salt = 0
			velocitat = 0
			get_node("mort kirby").play()
			
			morint = true
			
				
func escenari_general_after347(delta):
	animatedSprite.visible = false
	Anim_Sprite.visible = true
	while comprova < 1:
			comprova += 1
	get_node("salt").stop()
	get_node("mort kirby").stop()
	var Visible = kirby.comprova

			
	if Visible == 1:
		get_node("Camera2D").current = true
		Moviment.x = 0
		if is_on_floor():
			
			
				
			if Input.is_action_pressed("dreta"):
#				Desplacament += Vector2 (5,0)
				Anim_Sprite.play("run")
#				actualitza_direccio(velocity)
		
			if Input.is_action_pressed("enfadat"):
				Anim_Sprite.play("nova")
			
			
				
			if Input.is_action_pressed("esquerra"):
#				Desplacament += Vector2 (-5,0) 
				Anim_Sprite.play("run")
	#			actualitza_direccio(velocity)
	
			if Input.is_action_pressed("amunt"):
				Anim_Sprite.play("jump")
				Moviment.y= -Salt
				get_node("salt").play()
	
				if Input.is_action_pressed("amunt") and (Input.is_action_pressed("dreta") or Input.is_action_pressed("esquerra")):
					Anim_Sprite.play("jump")
					Moviment.y= -Salt
					
		else:
			if Input.is_action_pressed("amunt") and Input.is_action_pressed("dreta") or Input.is_action_pressed("esquerra"):
				Anim_Sprite.play("jump")
				


		if Input.is_action_pressed("dreta"):
				Desplacament += Vector2 (2,0)
		
		if Input.is_action_pressed("esquerra"):
				Desplacament += Vector2 (-2,0)
		
			
		if Input.is_action_pressed("descans"):
			Anim_Sprite.play("descans")
		
		if Input.is_action_pressed("amunt") == false and Input.is_action_pressed("dreta") == false and Input.is_action_pressed("esquerra") == false and Input.is_action_pressed("enfadat") == false and is_on_floor():
			Anim_Sprite.play("idle")
			Desplacament = Vector2.ZERO
		Moviment += Desplacament.normalized() * Velocitat
		Moviment += Gravetat * delta
		actualitza_direccio(Moviment)
	#	velocity = Moviment
		move_and_slide(Moviment, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	pass
	
	
	if position.x <= 360:
		escenari_general_abans247(delta)
	else:
		escenari_general_after347(delta)
		

func actualitza_direccio(moviment):
	Anim_Sprite.flip_h= moviment.x<0





func _on_Area2D_body_entered(body):
	if body.name == ("kirby"):
		position.x = 367
		


func _on_Area2D25_body_entered(body):
	if body.name == ("kirby"):
		nubol.queue_free()
		$riure.playing = true


func _on_Area2D26_body_entered(body):
	if body.name == ("kirby"):
		$riure.playing = false




func _on_mort_kirby_finished():
	position.x = -490
