
import fileinput, re, logging
from bracelogs import BraceMessage as __

logging.basicConfig(format='%(asctime)s [%(levelname)s] %(message)s',)
LOGGER = logging.getLogger(__name__)
LOGGER.setLevel(logging.DEBUG)

matchCardFormat = re.compile(r"^[456][0-9]{3}-?[0-9]{4}-?[0-9]{4}-?[0-9]{4}$")
matchDuplicateCharacters = re.compile(r"(.)\1{3,}")

def readLinesFromStdin():
    lines = []
    for line in fileinput.input():
        lines.append(line.rstrip())

    #remove the line count
    lines = lines[1:]   
    return lines

def validateLine(line):
    isValid = False
    debugMessage = ""
    matchOnCardFormat = re.fullmatch(matchCardFormat, line)
    if(matchOnCardFormat):
        matchOnDuplicates = re.findall(matchDuplicateCharacters, line.replace("-", ""))
        if(matchOnDuplicates):
            isValid = False
            debugMessage = "at least one occurence of 4 consecutive repeated characters"
        else:
            isValid = True
            debugMessage = "no 4 consecutive repeated characters"
    else:
        isValid = False
        debugMessage = "bad card format"
    return (line, isValid, debugMessage)

def validateLines(lines):
    answers = []
    for l in lines:
        answers.append(validateLine(l))
    return answers


if __name__ == "__main__":
    lines = readLinesFromStdin()
    answers = validateLines(lines)
    for answer in answers:
        LOGGER.debug(__("{line},{details}", line=answer[0], details=answer[2]))
        if(answer[1]):
            print ("Valid")
        else: 
            print ("Invalid")
