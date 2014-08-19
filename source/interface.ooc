//
// Copyright (c) 2014 Simon Mika <simon@mika.se>
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in
// the documentation and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

IEquatable: interface <T> {
	equals: func(other: T) -> Bool
}
ValueEquatable: class implements IEquatable<Int> {
	value := 0
	init: func(=value) {}
	equals: func(other: Int) -> Bool {
		this value == other
	}
}

// Works:
c := ValueEquatable new(1337)
"using the class directly: " print()
(c equals(1337) && !(c equals(1338))) toString() println()

// Should work:
i := c as IEquatable<Int>
"using the interface: " print()
i equals(1337) toString() println()

ObjectEquatable: class implements IEquatable<ObjectEquatable> {
	value := 0
	init: func(=value) {}
	equals: func(other: ObjectEquatable) -> Bool {
		this value == other value
	}
}

// Works:
d := ObjectEquatable new(1337)
"using the class directly: " print()
(d equals(ObjectEquatable new(1337)) && !(d equals(ObjectEquatable new(1338)))) toString() println()

// Should work:
j := d as IEquatable<ObjectEquatable>
"using the interface: " print()
j equals(ObjectEquatable new(1337)) toString() println()
