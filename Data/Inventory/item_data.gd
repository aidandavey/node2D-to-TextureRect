class_name ItemData
extends Resource

@export var name: String = "default_name"
@export var item_scene: PackedScene

func save()->Dictionary:
	var dict: Dictionary = {}
	
	dict.get_or_add("name", name)
	dict.get_or_add("item_scene", item_scene._bundled)
	
	return dict
