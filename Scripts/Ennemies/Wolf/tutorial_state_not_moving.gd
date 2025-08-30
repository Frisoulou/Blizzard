extends State

var exit_not_moving_state = false

func Debug():
	pass

func Enter():
	pass

func Update(delta: float):
	print(exit_not_moving_state)
	if exit_not_moving_state:
		Transitioned.emit(self, "Running")
	
func Physics_update(delta: float):
	pass
