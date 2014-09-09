ColorBgra: cover {
	blue, green, red, alpha: UInt8
	init: func@ (=blue, =green, =red, =alpha)
	init: func@ ~int (b, g, r, a: Int) { this init(b as UInt8, g as UInt8, r as UInt8, a as UInt8) }
}

RasterBgra: class {
	width, height: Int
	pointer: UInt8*
	init: func (other: RasterBgra) {
		row := this pointer as UInt8*
		rowLength := this width
		rowEnd := row as ColorBgra* + rowLength
		destination := row as ColorBgra*
		f := func (color: ColorBgra) {
			(destination)@ = color 
			destination += 1
		//	FIXME: "Invalid comparison between ColorBgra* and ColorBgra*"
			if (destination as ColorBgra* >= rowEnd)
			{
				// Blah
			}
		}
	}
}
