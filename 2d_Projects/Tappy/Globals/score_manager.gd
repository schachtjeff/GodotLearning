extends Node

const SCORES_PATH: String = "user://tappy_score.tres"
# Below is if you want to save with binary form.
#const SCORES_PATH: String = "user://tappy_score.res"

var high_score: int = 0:
	get:
		return high_score
	set(value):
		if value > high_score:
			high_score = value
			save_high_score()
			
func _ready() -> void:
	load_high_score()

func load_high_score() -> void:
	# Check if file exists and load it.
	if ResourceLoader.exists(SCORES_PATH):
		var hsr: HighScoreResource = load(SCORES_PATH)
		# check to see if hsr object is validated
		if hsr: high_score = hsr.high_score

func save_high_score() -> void:
	#hsr is high res resource
	# Create a new instance of the resource and save high_score to it.
	var hsr: HighScoreResource = HighScoreResource.new()
	hsr.high_score = high_score
	# save the hsr object with path
	ResourceSaver.save(hsr, SCORES_PATH)
	
