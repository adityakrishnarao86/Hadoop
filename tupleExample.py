# A tuple is a collection which is ordered and unchangeable. 
# In Python tuples are written with round brackets.

input = ("Spark","Scala","Python","JavaScript","C++","C")
print(input)
#input[0] = "KAFKA" # 'tuple' object does not support item assignment..so it throws ERROR
# print(input)																								
for x in input:
   print("TUPLE ELEMENTS ARE => " , x)
print("--------------------------------------")
if "C+" in input:
    print("C++ one of the element of input tuple")
else:
   print("Its Not a member of tuple list")

print("--------------------------------------")
print("LENGTH OF THE TUPLE IS => " , len(input))
print("--------------------------------------")
input1 = tuple(("AAA","BBB","CCC","DDD"))
print(input1)
