tech = ["Java","Python","C++","C","RubyOnRails","JavaScript"]
print("List Elements are: " , tech)

tech[1] = "VC++"
print("New List Elements are: " , tech)

for x in tech:
   print(x)

if "C++" in tech:
   print("C++ is one of the tech elements")
else:
   print("Not a member")

print("=================================")
print("LENGTH OF LIST: " , len(tech))
print("=================================")
tech.append("HADOOP")
print("AFTER APPENDING TO LIST: " , tech)
print("=================================")
tech.pop() # by default last value will be deleted using pop() of list
print("POP METHOD OUTPUT : ", tech)
print("=================================")
tech.insert(0,"SPARK")
print("LIST AFTER INSERTING ELEMENT AT THE 0th POSITION :" , tech)
