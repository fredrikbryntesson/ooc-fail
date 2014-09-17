import lang/IO
import io/File
import io/FileReader
import io/FileWriter
import io/BinarySequence

filename := "bin.bin"
file := File new(filename)
seqW := BinarySequenceWriter new(FileWriter new(file))
one: Octet = 42
onePointer: Octet* = one&
for (i in 0..404496)
	seqW bytes(onePointer, 1)

seqR := BinarySequenceReader new(FileReader new(file))
data := seqR bytes(404496)
for (i in 0..404496) {
	if ((data + i)@ == 0) {
		"#{i} is 0!" println()
		// Fails at 401408 on APID
		break
	}
}
