#!/usr/bin/python3



import cgi 

import subprocess



print("content-type: text/html")

print()



fun = cgi.FieldStorage()

cmd = fun.getvalue("x")



o = subprocess.getoutput("sudo " +cmd)

print(o)
print("hello")
