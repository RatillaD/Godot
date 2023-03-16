extends Sprite

onready var musica2 = $musica

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_node("musica").play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_castell_body_entered(body):
	if body.name == ("kirby"):
		get_node("musica").stop()
		get_node("victoria").play()
		get_node("kirby").visible = false
