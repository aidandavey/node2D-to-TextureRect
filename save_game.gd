extends Node

@export var main_scene: Node


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("save_game"):
		save_game()


func get_save_data()->Dictionary:
	var dict: Dictionary = {}	
	if main_scene:
		if main_scene.get("inventory_data"):
			dict.get_or_add(main_scene.get("inventory_data").save())
			
		# if other_scene.get("other_data"):
			#dict.get_or_add(other_scene.get("other_data").save())
			
	return dict


func save_dict_to_file(dict: Dictionary):
	print(dict)

func save_game():
	save_dict_to_file(get_save_data())
	
	
