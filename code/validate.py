# Enter your code here. Read input from STDIN. Print output to STDOUT

import fileinput, re
DEBUG = True


##############
# define regex
##############
matchCardFormat = re.compile(r"^[456][0-9]{3}-?[0-9]{4}-?[0-9]{4}-?[0-9]{4}$")
matchDuplicateCharacters = re.compile(r"(.)\1")

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
        matchOnDuplicates = re.findall(matchDuplicateCharacters, l)
        if(matchOnDuplicates):
            if(len(matchOnDuplicates) > 1):
                 message = "Invalid"
                 if(DEBUG):
                     message = message + " - more than one duplicate character"
            else:
                 message = "Valid" 
                 if(DEBUG):
                     message = message + " - only one duplicate character" 
        else:
             message = "Valid" 
             if(DEBUG):
                 message = message + " - no duplicate characters"
    else:
        message = "Invalid" 
        if(DEBUG):
            message = message + " - bad card format"
    print (message)
