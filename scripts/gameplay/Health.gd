class_name Health
extends Node

signal death()

@export var MaxHealth = 1.0

@onready var CurrentHealth = MaxHealth

func damage(amount : float):
	CurrentHealth -= amount

	if (CurrentHealth <= 0):
		CurrentHealth = 0
		emit_signal("death")