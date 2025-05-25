extends GutTest
class_name TestIntResourceVariable

func test_value_is_set_and_get_correctly():
	var r = IntResourceVariable.new()
	r.value = 10
	assert_eq(r.value, 10)

func test_signal_is_emitted_when_value_changes():
	var r = IntResourceVariable.new()
	var result  = SignalSpy.new()
	r.connect("changed", 
	func(): 
		result.handler()
	)
	
	r.value = 20
	assert_true(result.called)

func test_signal_is_not_emitted_when_value_is_same():
	var r = IntResourceVariable.new()
	var emitted = false
	r.value = 10

	r.connect("changed", func(): emitted = true)

	r.value = 10
	assert_false(emitted)
