file = open("writeToFile.txt","a")
#file.write("NEW LINE ADDED HERE TO THE EXISTING FILE \n")
file.writelines(["Added line1 \n","Added line2 \n","Added line3 \n"])
file.close()
