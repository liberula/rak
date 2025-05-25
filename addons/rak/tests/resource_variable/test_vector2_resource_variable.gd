extends GutTest
class_name TestVector2ResourceVariable

func test_value_is_set_and_get_correctly():
	var r = Vector2ResourceVariable.new()
	r.value = Vector2(1,1)
	assert_eq(r.value, Vector2(1,1))

func test_signal_is_emitted_when_value_changes():
	var r = Vector2ResourceVariable.new()
	var result  = SignalSpy.new()
	r.connect("changed", 
	func(): 
		result.handler()
	)
	
	r.value = Vector2(1,1)
	assert_true(result.called)

func test_signal_is_not_emitted_when_value_is_same():
	var r = Vector2ResourceVariable.new()
	var emitted = false
	r.value = Vector2(1,1)

	r.connect("changed", func(): emitted = true)

	r.value = Vector2(1,1)
	assert_false(emitted)
