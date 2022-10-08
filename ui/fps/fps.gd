extends Label

func _process(delta):
	self.text = str(Performance.get_monitor(0))
