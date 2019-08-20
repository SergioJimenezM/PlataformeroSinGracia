extends RigidBody2D

var direccion = Vector2() setget _setDireccion, _getDireccion
var velocidad = Vector2()
var velocidadMovimiento
var velocidadMaxima

func _setDireccion(value):
	direccion = Vector2(value , 0)

func _getDireccion():
	return direccion