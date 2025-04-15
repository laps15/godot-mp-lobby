extends Control

@export var landing_page: LandingPage 
@export var lobby_page: CanvasLayer 

var current_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.lobby_page.hide()
	self.landing_page.done.connect(self._switch_to_lobby)

func _switch_to_lobby() -> void:
	self.landing_page.hide()
	self.lobby_page.show()
