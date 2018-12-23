pragma experimental SMTChecker;

contract C
{
	function f() public pure {
		bytes2 a = 0x1234;
		bytes4 b = bytes4(a); // b will be 0x12340000
		// This should fail (right padding).
		assert(a == b);
	}
}
