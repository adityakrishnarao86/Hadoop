# A dictionary is a collection which is unordered, changeable and indexed. 
# In Python dictionaries are written with curly brackets, and they have keys and values.

inputDict = { "id":101010 , "name": "Gopal" , "sal":12000 , "city": "Hyd","state":"TS" }
print("DICTIONARY ELEMENTS ARE : " , inputDict)
print("--------------------------------------------------------------------------------")
selElement = inputDict["city"]
print("SELECTED ELEMENT IS: " , selElement)
print("--------------------------------------------------------------------------------")
inputDict = { "id":101010 , "name": "Gopal" , "sal":12000 , "city": "Hyd","state":"TS" }
inputDict["city"] = "Bangalore"
print("DICTIONARY ELEMENTS after Change ARE : " , inputDict)
print("--------------------------------------------------------------------------------")
for x in inputDict:
    print(inputDict[x]) # will print the values only
print("--------------------------------------------------------------------------------")
for x, y in inputDict.items():
  print(x, y)       # item function is used to Loop thru Key, Value and retrive the same
print("--------------------------------------------------------------------------------")
print("LENGTH OF DICTIONARY IS  => " , len(inputDict) )
print("--------------------------------------------------------------------------------")
if "city" in inputDict:
    print("Its one of the element in Dictionary")
else:
    print("Its NOT a member")
print("--------------------------------------------------------------------------------")
print(" ***************** TO ADD THE ELEMENTS TO DICTIONARY ***************************")
inputDictNew = { "id":101010 , "name": "Gopal" , "sal":12000 , "city": "Hyd","state":"TS" }
inputDictNew["desg"] = "STA"
print("AFTER ADDING THE ELEMENTS TO THE DICTIONARY : " , inputDictNew)
print(" ***************** TO REMOVE A SPECIFIC ELEMENT FROM DICTIONARY ***************************")
inputDictNew.pop("sal")
print("ELEMENTS AFTER REMOVAL : " , inputDictNew)
