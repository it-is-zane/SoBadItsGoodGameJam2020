extends Node2D
export var Destination :NodePath
export var NewScene :String
export(int,"Destination","NewScene") var Desision
var ready = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if ready:
		if not Desision:
			if not (body is RigidBody2D):
				body.global_position = get_node(Destination).global_position
		else:
			get_tree().change_scene(NewScene)

func _on_Timer_timeout():
	ready = true
