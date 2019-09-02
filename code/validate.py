
import fileinput, re
DEBUG = False

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
    message = ""
    matchOnCardFormat = re.fullmatch(matchCardFormat, line)
    if(matchOnCardFormat):
        matchOnDuplicates = re.findall(matchDuplicateCharacters, line.replace("-", ""))
        if(matchOnDuplicates):
            message = "Invalid"
            if(DEBUG):
                message = "{},{},{}".format(line, message,  "at least one occurence of 4 consecutive repeated characters")
        else:
            message = "Valid" 
            if(DEBUG):
                message = "{},{},{}".format(line, message,  "no 4 consecutive repeated characters")
    else:
        message = "Invalid" 
        if(DEBUG):
            message = "{},{},{}".format(line, message,  "bad card format")
    return message

def validateLines(lines):
    answers = []
    for l in lines:
        answers.append(validateLine(l))
    return answers


if __name__ == "__main__":
    lines = readLinesFromStdin()
    answers = validateLines(lines)
    for answ in answers:
        print (answ)