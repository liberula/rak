extends GutTest
class_name TestFloatResourceVariable

func test_value_is_set_and_get_correctly():
	var r = FloatResourceVariable.new()
	r.value = 2.3
	assert_eq(r.value, 2.3)

func test_signal_is_emitted_when_value_changes():
	var r = FloatResourceVariable.new()
	var result  = SignalSpy.new()
	r.connect("changed", 
	func(): 
		result.handler()
	)
	
	r.value = 2.3
	assert_true(result.called)

func test_signal_is_not_emitted_when_value_is_same():
	var r = FloatResourceVariable.new()
	var emitted = false
	r.value = 2.3

	r.connect("changed", func(): emitted = true)

	r.value = 2.3
	assert_false(emitted)
