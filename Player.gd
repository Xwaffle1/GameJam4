extends RigidBody

var velocity = Vector3()
var can_jump = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass

func jump():	
	print("JUMP")
	
func _physics_process(delta):
	can_jump = $JumpRayCast.is_colliding()
	print(can_jump)
	if $JumpRayCast.get_collider() != null:
		print($JumpRayCast.get_collider().name)
	
func can_jump():
	return can_jump

func _integrate_forces(state):
	
	state.linear_velocity.x = 1
	var velocity = Vector3(1,0,0)

	# Detect input and alter the state accordingly
	if Input.is_action_just_pressed("jump") and can_jump():
		jump()
		state.linear_velocity.y = state.linear_velocity.y + 6
	state.set_linear_velocity(state.linear_velocity)
