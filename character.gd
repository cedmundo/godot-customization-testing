extends Node3D

@export var customization_options: Dictionary = {}
@onready var _skeleton := $TentacleArmature/Skeleton3D
@onready var _head_attachment := $Parts/HeadAttachment
@onready var _anim_player := $AnimationPlayer

var _cur_head: Node
var _cur_body: Node

func update_customization() -> void:
	if _cur_head:
		_cur_head.queue_free()
	if _cur_body:
		_cur_body.queue_free()
	
	var want_head = customization_options.get("head", "var1")
	var head_file = "res://Parts/head_%s.tscn" % [want_head]
	var head_resource := load(head_file)
	var head_node = head_resource.instantiate()
	_head_attachment.add_child(head_node)
	_cur_head = head_node
	
	var want_body = customization_options.get("body", "var1")
	var body_file = "res://Parts/body_%s.tscn" % [want_body]
	var body_resource := load(body_file)
	var body_node = body_resource.instantiate()
	var body_mesh = body_node.get_node("TentacleArmature/Skeleton3D/Cube").duplicate()
	_skeleton.add_child(body_mesh)
	_cur_body = body_mesh

func set_head(new_head: String) -> void:
	customization_options["head"] = new_head
	self.update_customization()
	
func set_body(new_body: String) -> void:
	customization_options["body"] = new_body
	self.update_customization()

func _ready():
	_anim_player.play("Wave")
