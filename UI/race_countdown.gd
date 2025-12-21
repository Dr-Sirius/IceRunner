class_name Countdown extends Control

@onready var _3: Label = $"3"
@onready var _2: Label = $"2"
@onready var _1: Label = $"1"
@onready var go: Label = $go
@onready var timer: Timer = $Timer

func countdown():
	timer.start()
	_3.visible = true
	await timer.timeout
	timer.start()
	_3.visible = false 
	_2.visible = true
	await timer.timeout 
	timer.start()
	_2.visible = false 
	_1.visible = true
	await timer.timeout 
	timer.start(0.5)
	_1.visible = false 
	go.visible = true
	await timer.timeout 
	go.visible = false
	Global.start_race(5)
