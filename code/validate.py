
import fileinput, re
DEBUG = False


##############
# define regex
##############
matchCardFormat = re.compile(r"^[456][0-9]{3}-?[0-9]{4}-?[0-9]{4}-?[0-9]{4}$")
matchDuplicateCharacters = re.compile(r"(.)\1{3,}")

###############
# read in lines
###############
lines = []
for line in fileinput.input():
    lines.append(line.rstrip())

#remove the line count
lines = lines[1:]   

################
# validate lines
################
for l in lines:
    message = ""
    matchOnCardFormat = re.fullmatch(matchCardFormat, l)
    if(matchOnCardFormat):
        matchOnDuplicates = re.findall(matchDuplicateCharacters, l.replace("-", ""))
        if(matchOnDuplicates):
            message = "Invalid"
            if(DEBUG):
                message = "{},{},{}".format(l, message,  "at least one occurence of 4 consecutive repeated characters")
        else:
             message = "Valid" 
             if(DEBUG):
                message = "{},{},{}".format(l, message,  "no 4 consecutive repeated characters")
    else:
        message = "Invalid" 
        if(DEBUG):
            message = "{},{},{}".format(l, message,  "bad card format")
    print (message)
