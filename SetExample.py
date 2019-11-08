# A set is a collection which is unordered and unindexed. 
# In Python sets are written with curly brackets.

inputSet = { "Spark","Scala","Java","RubyOnRails","C++","C" }
print("Elements of Set Are: " , inputSet) # It will print output in Random Stype as Set are UnOrdered
print("-----------------------------------------------------------------")
print("+++++++++++++++++++++ To Access the Elements of Set ++++++++++++++++++++++++++++++")
for x in inputSet:
   print("Elements Of Set :" , x)
print("-----------------------------------------------------------------")
print("+++++++++++++++++++++ To Add One Element to Set ++++++++++++++++++++++++++++++")
inputSet.add("HADOOP")
print("After Adding to the Set: " , inputSet)
print("+++++++++++++++++++++ To Add More Elements to Set ++++++++++++++++++++++++++++++")
inputSet.update(["cobol","perl","cloudcomputing"])
print("After Adding More Elements to the Set: " , inputSet)
print("+++++++++++++++++++++ To Remove A Element from Set ++++++++++++++++++++++++++++++")
inputSet.discard("Java")
print("After Removing A Elment from the Set: " , inputSet)
