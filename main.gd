extends Node2D

@onready var inventory_interface: MarginContainer = %InventoryInterface

var inventory_data: InventoryData = preload("res://Data/Resources/inventory_data_resource.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_interface.set_inventory_data(inventory_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
