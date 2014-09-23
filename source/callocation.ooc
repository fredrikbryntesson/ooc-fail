use ooc-base
use ooc-math
//import os/Time
//import structs/HashMap

//Foo: cover {
//	i := 1337
//	s := "foobar"
//	init: func
//	dispose: func {
//		free(s _buffer)
//		free(s)
//		free(s _buffer mallocAddr)
//		free(this)
//	}
//}

for(i in 0..1024) {
	foo := Dictionary new()
	defaultTransform := Cell new(FloatTransform2D identity)
	key := "Transform"
	transformCell := foo get(key, defaultTransform)
	transform := transformCell get() as FloatTransform2D
	gc_free(transformCell)
	gc_free(key _buffer)
	gc_free(key)
	gc_free(defaultTransform)
	foo dispose()
//	gc_free(foo)
//	foo := Cell< [1024] new()
//	foo free()
//	free(foo data)
//	gc_free(foo)
//	for(j in 0..1024) {
//		foo[j] = Foo new()
//		foo[j] dispose()
//	}
//	foo dispose()
//	free(foo)
}

//s := "Done! We are done! We are super duper done! We are in fact so done that I have to type a very long string and I should probably just copy and repeat some text or something."
//s println()
//free(s _buffer)
//free(s)
//Time sleepMilli(5000)
