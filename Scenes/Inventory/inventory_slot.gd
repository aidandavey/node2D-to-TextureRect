extends MarginContainer

signal slot_clicked(index:int, button_index:int)

@onready var texture_rect: TextureRect = %TextureRect
@onready var quantity_label: Label = $PanelContainer/QuantityLabel
@onready var item_holder: Node2D = %ItemHolder
@onready var sub_viewport: SubViewport = %SubViewport

func populate_slot_data(slot_data:InventorySlot) -> void:
	
	for node in item_holder.get_children():
		node.queue_free()

	var item = slot_data.slot_item.item_scene.instantiate()
	item_holder.add_child(item)
	
	texture_rect.texture = sub_viewport.get_texture()
	
	quantity_label.text = str(slot_data.quantity)
	tooltip_text = slot_data.slot_item.name
	
	if slot_data.quantity > 1:
		quantity_label.show()
	else:
		quantity_label.hide()
