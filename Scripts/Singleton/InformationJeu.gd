extends Node

export ( int ) var point_de_vie_max = 20

var point = 0
var pointDeVie = point_de_vie_max

#lorsque le boutton recommencer est cliqué
func reinitialiser_vie():
	point = 0
	pointDeVie = point_de_vie_max
