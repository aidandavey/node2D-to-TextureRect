extends Resource
class_name InventorySlot

const MAX_SLOT_QTY:int = 99

@export var slot_item:ItemData
@export_range(1, MAX_SLOT_QTY) var quantity:int

func save()->Dictionary:
	var dict: Dictionary = {}
	
	dict.get_or_add("quantity", quantity)
	dict.get_or_add("slot_item", slot_item.save())
	
	return dict
	
	
