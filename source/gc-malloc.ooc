pointer: UInt8* = 0
pointer2 : UInt8* = 0
size: Int = 131049
pointer = gc_malloc(size)
pointer toString() println()
"___|___|___|___|" println()

size = 131048
pointer2 = gc_malloc(size)
pointer2 toString() println()

