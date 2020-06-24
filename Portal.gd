extends Node2D
export var Destination :NodePath
var ready = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.global_transform
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if ready:
		if not (body is RigidBody2D):
			body.global_position = get_node(Destination).global_position


func _on_Timer_timeout():
	ready = true
