import json

# a Python object (dictionary):
x = {
  "name": "Gopal",
  "sal": 12000,
  "city": "Hyderabad",
  "state": "Telangana",
  "desg": "SeniorTechnicalArchitect(STA)"
}

# convert into JSON:
y = json.dumps(x)

# the result is a JSON string:
print(y)
