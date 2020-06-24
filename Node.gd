extends Node
export var maxDist :float = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for viewer in get_tree().get_nodes_in_group("viewer"):
		if (viewer.get_global_transform()[2] - get_parent().get_global_transform()[2]).length() > maxDist:
			get_parent().queue_free()
