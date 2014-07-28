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

// Builds, but does not use the binary minus operator
PointA: cover {
	x, y: Float
	init: func@ (=x, =y)
//	difference: func (other: This) -> This { this - other }
	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
	operator - (other: This) -> This { This new(this x - other x, this y - other y) }
	operator - -> This { This new(-this x, -this y) }
}

// Builds, but implements only the binary minus operator, not the unary one
PointB: cover {
	x, y: Float
	init: func@ (=x, =y)
	difference: func (other: This) -> This { this - other }
	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
	operator - (other: This) -> This { This new(this x - other x, this y - other y) }
//	operator - -> This { This new(-this x, -this y) }
}

// Builds, but does not implement binary minus operator, only the unary one
PointC: cover {
	x, y: Float
	init: func@ (=x, =y)
	difference: func (other: This) -> This { this + (-other) }
	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
//	operator - (other: This) -> This { This new(this x - other x, this y - other y) }
	operator - -> This { This new(-this x, -this y) }
}

//	Does NOT build, "error Argl, you need 2 arguments to override the '-' operator, not 1"
//PointD: cover {
//	x, y: Float
//	init: func@ (=x, =y)
//	difference: func (other: This) -> This { this - other }
//	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
//	operator - (other: This) -> This { This new(this x - other x, this y - other y) }
//	operator - -> This { This new(-this x, -this y) }
//}

//	Does NOT build, even though we're actually just subtracting a Float from a Float
//PointE: cover {
//	x, y: Float
//	init: func@ (=x, =y)
//	difference: func (other: This) -> This { this - other }
//	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
//	operator - (other: This) -> This { This new(this x - (other x), this y - (other y)) }
//	operator - -> This { This new(-this x, -this y) }
//}

// Builds, but requires use of the unary minus operator, cannot use the binary one
PointF: cover {
	x, y: Float
	init: func@ (=x, =y)
	difference: func (other: This) -> This { this + (- other) }
	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
	operator - (other: This) -> This { This new(this x - other x, this y - other y) }
	operator - -> This { This new(-this x, -this y) }
}

// Builds, but requires the binary minus operator to use the unary one
PointG: cover {
	x, y: Float
	init: func@ (=x, =y)
	difference: func (other: This) -> This { this + (- other) }
	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
	operator - (other: This) -> This { This new(this x + (- other x), this y + (- other y)) }
	operator - -> This { This new(-this x, -this y) }
}

// Builds, but requires explicit casting to Float
PointH: cover {
	x, y: Float
	init: func@ (=x, =y)
	difference: func (other: This) -> This { this + (- other) }
	operator + (other: This) -> This { This new(this x + other x, this y + other y) }
	operator - (other: This) -> This { This new(this x - other x as Float, this y - other y as Float) }
	operator - -> This { This new(-this x, -this y) }
}
