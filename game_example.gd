extends CanvasLayer

@onready var game_label: Label = $Panel/VBoxContainer/Label
@onready var timer: Timer = $Panel/VBoxContainer/Control/Timer
@onready var clock_label: Label = $Panel/VBoxContainer/Control/Label

var total_seconds = 0

func _ready() -> void:
	LobbyService.all_players_loaded.connect(self.game_start)
	self.game_label.text = str("Loading...")

	LobbyService.player_loaded.rpc_id(1)

func game_start():
	self.local_game_start.rpc()

@rpc("call_local")
func local_game_start():
	self.game_label.text = str("The game has started!")
	self.timer.start()

func _on_timer_timeout():
	self.total_seconds += 1
	self.clock_label.text = self._format_time(self.total_seconds)

func _format_time(seconds: int) -> String:
	var h = int(total_seconds / 3600)
	var m = int(total_seconds / 60)
	var s = int(total_seconds - m * 60 - h * 3600)
	
	return "%02d:%02d:%02d" % [h,m,s]
