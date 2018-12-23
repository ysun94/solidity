pragma experimental SMTChecker;

contract C
{
	function f() public pure {
		bytes2 a = 0x1234;
		bytes1 b = bytes1(a); // b will be 0x12
		// This should fail.
		assert(b == 0);
	}
}
