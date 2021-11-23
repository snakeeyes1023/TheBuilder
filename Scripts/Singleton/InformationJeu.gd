extends Node

export ( int ) var point_de_vie_max = 20
export ( int ) var argent = 1000
var point = 0
var pointDeVie = point_de_vie_max
var niveau_termine_global = false

func ajouter_argent(argent_a_ajouter):
	argent += argent_a_ajouter

#lorsque le boutton recommencer est cliqué
func reinitialiser_vie():
	point = 0
	pointDeVie = point_de_vie_max
