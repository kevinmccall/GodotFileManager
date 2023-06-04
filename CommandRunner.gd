extends Node

@export var command: String

signal command_changed(new_command)

func run_command(args: Array):
	OS.execute(command, args)

func get_command():
	return command

func set_command(command: String):
	self.command = command
	command_changed.emit(command)
