extends GutTest
class_name TestBoolResourceVariable

func test_value_is_set_and_get_correctly():
	var r = BoolResourceVariable.new()
	r.value = true
	assert_eq(r.value, true)

func test_signal_is_emitted_when_value_changes():
	var r = BoolResourceVariable.new()
	var result  = SignalSpy.new()
	r.connect("changed", 
	func(): 
		result.handler()
	)
	
	r.value = true
	assert_true(result.called)

func test_signal_is_not_emitted_when_value_is_same():
	var r = BoolResourceVariable.new()
	var emitted = false
	r.value = true

	r.connect("changed", func(): emitted = true)

	r.value = true
	assert_false(emitted)
