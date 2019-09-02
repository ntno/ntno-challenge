import unittest, sys, tempfile, io
from contextlib import redirect_stdout
import validate



def stripNewlines(string):
    return string.replace('\n', '')

def executeMainAndCaptureOutput(dummyStdinFileName):
    #https://stackoverflow.com/questions/6271947/how-can-i-simulate-input-to-stdin-for-pyunit
    sys.stdin = open(dummyStdinFileName,'r')

    #https://eli.thegreenplace.net/2015/redirecting-all-kinds-of-stdout-in-python/
    f = io.StringIO()
    with redirect_stdout(f):
        validate.main()
    
    sys.stdin.close()
    return f.getvalue()

def readFileToString(filename):
    fileHandle = open(filename)
    string = fileHandle.read()
    fileHandle.close()
    return string

class TestValidateAgainstHackerRank(unittest.TestCase):
    def test_case_zero(self):
        actualOutput = stripNewlines(executeMainAndCaptureOutput('input/input00.txt'))
        expectedOutput = stripNewlines(readFileToString('output/output00.txt'))
        self.assertEqual(actualOutput, expectedOutput)

    def test_case_one(self):
        actualOutput = stripNewlines(executeMainAndCaptureOutput('input/input01.txt'))
        expectedOutput = stripNewlines(readFileToString('output/output01.txt'))
        self.assertEqual(actualOutput, expectedOutput)

    def test_case_two(self):
        actualOutput = stripNewlines(executeMainAndCaptureOutput('input/input02.txt'))
        expectedOutput = stripNewlines(readFileToString('output/output02.txt'))
        self.assertEqual(actualOutput, expectedOutput)

    def test_case_three(self):
        actualOutput = stripNewlines(executeMainAndCaptureOutput('input/input03.txt'))
        expectedOutput = stripNewlines(readFileToString('output/output03.txt'))
        self.assertEqual(actualOutput, expectedOutput)

    def test_case_four(self):
        actualOutput = stripNewlines(executeMainAndCaptureOutput('input/input04.txt'))
        expectedOutput = stripNewlines(readFileToString('output/output04.txt'))
        self.assertEqual(actualOutput, expectedOutput)

    def test_case_five(self):
        actualOutput = stripNewlines(executeMainAndCaptureOutput('input/input05.txt'))
        expectedOutput = stripNewlines(readFileToString('output/output05.txt'))
        self.assertEqual(actualOutput, expectedOutput)


if __name__ == '__main__':
    unittest.main()
