use ooc-base
import os/Time
import structs/HashMap

Foo: cover {
	i := 1337
	s := "foobar"
	init: func
	dispose: func {
		free(s _buffer)
		free(s)
//		free(s _buffer mallocAddr)
//		free(this)
	}
}

for(i in 0..1024) {
	foo := Int [1024] new()
	for(j in 0..1024) {
//		foo[j] = Foo new()
//		foo[j] dispose()
	}
//	foo dispose()
//	free(foo)
}
"Done! We are done! We are super duper done! We are in fact so done that I have to type a very long string and I should probably just copy and repeat some text or something." println()
//Time sleepMilli(5000)
