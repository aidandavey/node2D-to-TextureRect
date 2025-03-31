extends Resource
class_name InventoryData

signal inventory_updated(inv_data:InventoryData)
signal inventory_interact(inv_data:InventoryData, index:int, button_index:int)

@export var slots:Array[InventorySlot]

func save()->Dictionary:
	var dict:Dictionary = {}
	
	for i in slots.size():
		if slots[i]:
			dict.get_or_add(i, slots[i].save())
	
	return dict

func on_slot_clicked(index:int, button_index:int):
	inventory_interact.emit(self, index, button_index)

func grab_slot_data(index:int)->InventorySlot:
	var slot_data = slots[index]
	if slot_data:
		slots[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null

func drop_slot_data(grabbed_slot_data:InventorySlot, index:int)->InventorySlot:
	var slot_data = slots[index]
	slots[index] = grabbed_slot_data
	inventory_updated.emit(self)
	return slot_data

func add_item(item_data:ItemData)->bool:
	
	for index in slots.size():
		if not slots[index]:
			var new_slot = InventorySlot.new()
			new_slot.slot_item = item_data
			new_slot.quantity = 1
			slots[index] = new_slot
			inventory_updated.emit(self)
			return true
	return false
