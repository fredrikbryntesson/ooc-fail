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

// Does not build
//PointCoverA : cover {
//	x, y: Float
//	Norm ::= (this x pow(2.0f) + this y pow(2.0f)) sqrt()
//}

// Builds just fine
PointCoverB: cover {
	x, y: Float
	Norm: Float { get { (this x pow(2.0f) + this y pow(2.0f)) sqrt() } }
}

// Builds just fine
PointClassA: class {
	x, y: Float
	Norm ::= (this x pow(2.0f) + this y pow(2.0f)) sqrt()
}

// Builds just fine
PointClassB: class {
	x, y: Float
	Norm: Float { get { (this x pow(2.0f) + this y pow(2.0f)) sqrt() } }
}
