/*
* Copyright (C) 2014 - Simon Mika <simon@mika.se>
*
* This sofware is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with this software. If not, see <http://www.gnu.org/licenses/>.
*/

GenericFunctionPointer: class <T> {
	init: func () {
	}

	// Function parameter of type T
	testGenericFunctionPointerT: func (f: Func (T)) {

		value := 10
		"Printing in function with parameter: func (f: Func (T))\n" println()
		"Printing with f(value as Int)" println()
		f(value as Int)
		"Printing with f(value)" println()
		f(value)
		"Printing with f(10)" println()
		f(10)
	}

	// Function parameter of type Int
	testGenericFunctionPointerInt: func (f: Func (Int)) {

		value := 10
		"Printing in function with parameter: func (f: Func (Int))\n" println()
		"Printing with f(value as Int)" println()
		f(value as Int)
		"Printing with f(value)" println()
		f(value)
		"Printing with f(10)" println()
		f(10)
	}
}

printValue := func (value: Int) {
	"Value is #{value}" println()


}

"Testing Generic Function Pointer" println()
genericFunctionPointer := GenericFunctionPointer<Int> new() as GenericFunctionPointer<Int>
"------------------------------------" println()
"printing in function: printValue(value)" println()
printValue(10)
"*************************" println()
genericFunctionPointer testGenericFunctionPointerInt(printValue)
"*************************" println()
genericFunctionPointer testGenericFunctionPointerT(printValue)
