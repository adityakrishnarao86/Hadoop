# A lambda function is a small anonymous function.
# A lambda function can take any number of arguments, but can only have one expression

x = lambda a: a + "Spark"
print("Result 1: " , x("Scala and "))
# print("-----------------------------------------------------------------------------------------"
input = lambda a,b: (a + b)
print("Result 2: " , input(10,20))
data = lambda a,b,c: (a+b*c)
print("Result 3: " , data(3,4,5))
def myfunc(n):
  return lambda a : a * n

mydoubler = myfunc(3)

print("Result 4: " , mydoubler(8))
