extends Node

var data = {
	"counter": 0,
	"coin": 0,
}

var data_path = "user://data.dat"

func load_data():
	if !FileAccess.file_exists(data_path):
		save_data()
		return
	
	var file = FileAccess.open(data_path, FileAccess.READ)
	data = JSON.parse_string(file.get_as_text())
	file.close()

func save_data():
	var file = FileAccess.open(data_path, FileAccess.WRITE)
	file.store_string(str(data))
	file.close()
