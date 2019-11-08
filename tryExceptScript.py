try:
  f = open("Input.log")
  f.write("Hello Gopal Krishna")
except:
  print("Something went wrong when writing to the file")
finally:
  f.close()
