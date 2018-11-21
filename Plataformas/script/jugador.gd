extends KinematicBody2D

const GRAVEDAD = 250
const VELOCIDAD = 200
const SALTO = 7000

var movimiento = Vector2()
var salud = 3
var salto = false

func _ready():
	
	pass

func _physics_process(delta):
	movimiento.x = 0
	movimiento.y = 0
	movimiento.y = GRAVEDAD
	
	if(Input.is_action_pressed("ui_left")):
		movimiento.x += -VELOCIDAD
	if(Input.is_action_pressed("ui_right")):
		movimiento.x += VELOCIDAD
	if(Input.is_action_just_pressed("ui_up") && salto):
		movimiento.y -= SALTO
	if(is_on_floor()):
		salto = true
	else:
			salto = false
	
	move_and_slide(movimiento, Vector2(0,-1), 0, 250, 45.0)
	# *** Parametros del move and slide ***
	# 1 - vector de movimiento, es lo que nos permite mover cosas
	# 2 - significa que arriba es arriba, esto puede ser muy util para voltear la gravedad 
	# 3 - numeros mayores a cero hacen mas dificil que el cuerpo logre subir pendientes
	# 4 - cambia la direccion en un choque, basicamente eso es rebotar, 
	# si algo no cambia de direccion, la gravedad lo detiene
	# 5- angulo maximo para que un cuerpo sea considerado suelo, tocar la pendiente significa tocar suelo
	# sin ese ultimo valor, el cuerpo NO puede saltar de nuevo al tocar la pendiente
	
	
func _disparos():
	pass

func _mas_vida():
	salud += salud

func _menos_vida():
	salud -= salud;

func _muerte():
	#animación de muerte es girar 10,20,30,90 grados y listo
	var etiqueta = Label.new()
	etiqueta.set_text("Has muerto")
	etiqueta.set_global_position(Vector2(500,300))
	get_parent().add_child(etiqueta)
	pass