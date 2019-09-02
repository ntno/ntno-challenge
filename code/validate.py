
import fileinput, re, logging

########## LOG SETUP ####################################################
#https://docs.python.org/3/howto/logging-cookbook.html
class BraceMessage:
    def __init__(self, fmt, *args, **kwargs):
        self.fmt = fmt
        self.args = args
        self.kwargs = kwargs

    def __str__(self):
        return self.fmt.format(*self.args, **self.kwargs)

__ = BraceMessage
logging.basicConfig(format='%(asctime)s [%(levelname)s] %(message)s',)
LOGGER = logging.getLogger(__name__)
# LOGGER.setLevel(logging.DEBUG)
###########################################################################


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
    matchOnCardFormat = re.fullmatch(matchCardFormat, line)
    if(matchOnCardFormat):
        matchOnDuplicates = re.findall(matchDuplicateCharacters, line.replace("-", ""))
        if(matchOnDuplicates):
            isValid = False
            LOGGER.debug(__("{line},{validity},{details}", line=line, validity=isValid, details="at least one occurence of 4 consecutive repeated characters")) 
        else:
            isValid = True
            LOGGER.debug(__("{line},{validity},{details}", line=line, validity=isValid, details="no 4 consecutive repeated characters")) 

    else:
        isValid = False
        LOGGER.debug(__("{line},{validity},{details}", line=line, validity=isValid, details="bad card format")) 
    return (line, isValid)


def validateLines(lines):
    answers = []
    for l in lines:
        answers.append(validateLine(l))
    return answers

def main():
    lines = readLinesFromStdin()
    answers = validateLines(lines)
    for answer in answers:
        if(answer[1]):
            print ("Valid")
        else: 
            print ("Invalid")


if __name__ == "__main__":
    main()
    
