extends Node2D

@onready var inventory_interface: MarginContainer = %InventoryInterface

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_interface.set_inventory_data(load("res://Data/Resources/inventory_data_resource.tres"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
