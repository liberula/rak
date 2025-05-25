class_name SignalSpy

extends Object

var called := false
var call_count := 0

func handler():
	called = true
	call_count += 1
