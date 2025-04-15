extends Control

@export var landing_page: LandingPage 
@export var lobby_page: CanvasLayer 
@export_file("*.tscn","*.scn") var game_scene_path: String

func _ready() -> void:
	self.lobby_page.hide()
	self.landing_page.done.connect(self._switch_to_lobby)
	self.lobby_page.start_game.connect(self._on_start_game)

func _switch_to_lobby() -> void:
	self.landing_page.hide()
	self.lobby_page.show()

func _on_start_game():
	print("Start game emitted.")
	if self.game_scene_path:
		print("On #", multiplayer.get_unique_id(), " calling start game for all.")
		LobbyService.load_game.rpc(self.game_scene_path)
