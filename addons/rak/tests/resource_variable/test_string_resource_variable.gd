extends GutTest
class_name TestStringResourceVariable

func test_value_is_set_and_get_correctly():
	var r = StringResourceVariable.new()
	r.value = "test_string"
	assert_eq(r.value, "test_string")

func test_signal_is_emitted_when_value_changes():
	var r = StringResourceVariable.new()
	var result  = SignalSpy.new()
	r.connect("changed", 
	func(): 
		result.handler()
	)
	
	r.value = "test_string"
	assert_true(result.called)

func test_signal_is_not_emitted_when_value_is_same():
	var r = StringResourceVariable.new()
	var emitted = false
	r.value = "test_string"

	r.connect("changed", func(): emitted = true)

	r.value = "test_string"
	assert_false(emitted)
