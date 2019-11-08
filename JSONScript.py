# Python has a built-in package called "json", which can be use to work with JSON data

import json

# Input JSON Data

x = ' { "id":1000,"name":"Gopal","desg":"STA","city":"Hyd","state":"TS","loc":"Hyderabad" } '

# To Parse the above JSON Data

parsedData = json.loads(x)

# The result is a Python dictionary

print("Result Is: " , parsedData)
print("Specific Element Is -->" , parsedData["desg"].encode("ascii", "ignore"))
