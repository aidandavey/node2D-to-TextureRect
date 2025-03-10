extends Resource
class_name InventorySlot

const MAX_SLOT_QTY:int = 99

@export var slot_item:ItemData
@export_range(1, MAX_SLOT_QTY) var quantity:int
#"res://test_item_resource.tres"
