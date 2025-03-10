class_name InventoryInterface
extends MarginContainer

@export var slot_scene = preload("res://Scenes/Inventory/inventory_slot.tscn")

@onready var grid_container: GridContainer = $PanelContainer/GridContainer

func set_inventory_data(inv_data:InventoryData)->void:
	_populate_slot_data(inv_data)
	inv_data.inventory_updated.connect(_populate_slot_data)

func _populate_slot_data(inv_data:InventoryData) -> void:
	for child in grid_container.get_children():
		child.queue_free()
		
	for slot in inv_data.slots:
		var inventory_slot = slot_scene.instantiate()	
		inventory_slot.slot_clicked.connect(inv_data.on_slot_clicked)
		grid_container.add_child(inventory_slot)		
		
		if slot:			
			inventory_slot.populate_slot_data(slot)
