extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left") and get_parent().has_method("left"):
		get_parent().left()
	if Input.is_action_pressed("ui_right") and get_parent().has_method("right"):
		get_parent().right()
	if Input.is_action_pressed("ui_up") and get_parent().has_method("jump"):
		get_parent().jump()
	if not (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")) and get_parent().has_method("idle"):
		get_parent().idle()
