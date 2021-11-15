extends Node2D

var ennemisDansZone = []

func _process(_delta):
	if !ennemisDansZone.empty():
		print(ennemisDansZone[0])



func _on_zoneDeDetection_body_entered(body):
	#ennemisDansZone.push_back(body)
	pass


func _on_zoneDeDetection_body_exited(body):
	#ennemisDansZone.remove(ennemisDansZone.find())
	pass
