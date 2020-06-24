extends Node2D
export var test :Resource
var Remover = preload("res://RemoveByDist.tscn")
var remover
var testinstance
export var time :float = 5
export var Max :int = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (len(get_children()) - 1) > Max:
		print(get_child(1))
		get_child(1).queue_free()


func _on_Timer_timeout():
	testinstance = test.instance()
	remover = Remover.instance()
	add_child(testinstance)
	testinstance.add_child(remover)
	$Timer.wait_time = time
