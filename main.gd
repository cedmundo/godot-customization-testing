extends Node3D

@export var available_head_variants := ["var1", "var2"]
@export var available_body_variants := ["var1", "var2"]
@onready var _character := $Character
var _head_pick = 0
var _body_pick = 0

func _on_b_select_head_pressed():
	_character.set_head(available_head_variants[_head_pick % available_head_variants.size()])
	_head_pick += 1


func _on_b_select_body_pressed():
	_character.set_body(available_body_variants[_body_pick % available_body_variants.size()])
	_body_pick += 1
