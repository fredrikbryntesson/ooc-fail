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

// The 2D transform is a 3x3 homogeneous coordinate matrix.
// The element order is:
// A D G
// B E H
// C F I

// Builds just fine
PointA: cover {
	x, y: Float
	init: func@ (=x, =y)
	Negative: func -> This { This new(-this x, this y) }
}

// Does not build, "error: field ‘Negative’ has incomplete type"
//PointB: cover {
//	x, y: Float
//	init: func@ (=x, =y)
//	Negative: This { get { This new(-this x, -this y) } }
//}

// Builds just fine, but obviously doesn't do what I want
PointC: cover {
	x, y: Float
	init: func@ (=x, =y)
	Negative: static This { get { This new(-1, -1) } }
}

// Does not build, since static methods obviously do not have access to instance variables
//PointD: cover {
//	x, y: Float
//	init: func@ (=x, =y)
//	Negative: static This { get { This new(-this x, -this y) } }
//}
