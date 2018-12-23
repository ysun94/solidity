pragma experimental SMTChecker;

contract C
{
	function f() public pure {
		bytes2 a = 0x1234;
		uint32 b = uint16(a); // b will be 0x00001234
		assert(b == 0x1234);
		uint32 c = uint32(bytes4(a)); // c will be 0x12340000
		// This should not fail.
		assert(c == 0x12340000);
		uint8 d = uint8(uint16(a)); // d will be 0x34
		// This should fail.
		assert(d == 0);
		uint8 e = uint8(bytes1(a)); // e will be 0x12
		// This should fail.
		assert(e == 0);
	}
}
// ----
// Warning: (251-274): Assertion violation happens here
