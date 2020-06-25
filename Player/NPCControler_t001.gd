extends Node
export var Target :NodePath
var target

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(Target)

func jump():
	var ShouldJump = false
	if $RightTop.is_colliding() and $RightTop.get_collision_normal() == Vector2.UP and not ($RightBottom.is_colliding()):
		ShouldJump = true
	if $LeftTop.is_colliding() and $LeftTop.get_collision_normal() == Vector2.UP and not ($LeftBottom.is_colliding()):
		ShouldJump = true
	if $RightTop.get_collision_normal().round() == Vector2.UP and $RightBottom.get_collision_normal().round() == Vector2.LEFT:
		ShouldJump = true
	if $LeftTop.get_collision_normal().round() == Vector2.UP and $LeftBottom.get_collision_normal().round() == Vector2.RIGHT:
		ShouldJump = true
	if ShouldJump:
		get_parent().jump()

func left():
	var shouldMove = false
	if $LeftBottom.get_collision_normal().round() == Vector2.UP or $LeftTop.get_collision_normal().round() == Vector2.UP:
		if $LeftBottom.is_colliding() or $LeftTop.is_colliding():
			shouldMove = true
		else:
			shouldMove = false
	elif ($LeftBottom.get_collision_point() - $LeftBottom.global_position).length() < 25:
		shouldMove = true
	if shouldMove:
		get_parent().left()
	else:
		get_parent().idle()


func right():
	var shouldMove = false
	if $RightBottom.get_collision_normal().round() == Vector2.UP or $RightTop.get_collision_normal().round() == Vector2.UP:
		if $RightBottom.is_colliding() or $RightTop.is_colliding():
			shouldMove = true
		else:
			shouldMove = false
	elif ($RightBottom.get_collision_point() - $RightBottom.global_position).length() < 25:
		shouldMove = true
	if shouldMove:
		get_parent().right()
	else:
		get_parent().idle()

func _process(delta):
	#for node in get_children():
	#	if node.get_collider() is RigidBody2D:
	#		node.get_collider().weight = 1
	jump()
	if target:
		if get_parent().global_position.x > target.global_position.x + 25:
			left()
		elif get_parent().global_position.x < target.global_position.x - 25:
			right()
		else:
			get_parent().idle()

