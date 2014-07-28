//
// Copyright (c) 2011-2014 Simon Mika <simon@mika.se>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.

import math
import text/StringTokenizer

PointA: cover {
	x, y: Float
	init: func@ (=x, =y)
	// This gives "error: expected identifier or ‘(’ before ‘union’". 
	// Union is a keyword in C and so cannot be used for method names,
	// but the name should be Point__union something, so there shouldn't be a problem.
	// Compiler bug?
	union: func (other: This) -> This {
		This new(0.0f, 0.0f)
	}
}

PointB: cover {
	x, y: Float
	init: func@ (=x, =y)
	// Using a suffix circumvents but does not solve the problem
	union: func ~point (other: This) -> This {
		This new(0.0f, 0.0f)
	}
}
