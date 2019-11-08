# When you have imported the "re" module, we can start using regular expressions:
import re

#Check if the string starts with "Python" and ends with "language":

txt = "Python is one of the top programming language"
x = re.search("^Python.*language$", txt)

if (x):
  print("Match Find")
else:
  print("No match")
