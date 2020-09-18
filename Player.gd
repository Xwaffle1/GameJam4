extends RigidBody

var velocity = Vector3()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass

func jump():	
	print("JUMP")

func can_jump():
	return $JumpRayCast.is_colliding()

func _integrate_forces(state):
	print(can_jump())
	state.linear_velocity.x = 1
	var velocity = Vector3(1,0,0)

	# Detect input and alter the state accordingly
	if Input.is_action_just_pressed("jump") and can_jump():
		jump()
		state.linear_velocity.y = state.linear_velocity.y + 6
	state.set_linear_velocity(state.linear_velocity)
