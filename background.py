import os.path
import os
import getpass
import sys
path=os.path.expanduser("~/background.images")

try:
    c_background=open(os.path.expanduser("~/scripts/.current_background"), 'x')
except:
    pass
c_background=open(os.path.expanduser("~/scripts/.current_background"), 'r+')
sys.argv.pop(0)
mode=sys.argv[0]
background_input=""
number_of_backgrounds=len(os.listdir(os.path.expanduser("~/background.images")))

try:
    background_input=sys.argv[1]
except:
    pass
if c_background.read()=="":
    c_background.seek(0)
    c_background.write("0")
    c_background.truncate()
if background_input!="":
    c_background.seek(0)
    c_background.write(background_input)
    c_background.truncate()

c_background=open(os.path.expanduser("~/scripts/.current_background"), 'r+')
try:
    c_background=c_background.read()
    c_background.strip()
    c_background=int(c_background)
except:
    print("the requested background is not valid!")
    exit()
if c_background>number_of_backgrounds:
    print("the requested background is outside of all the possible backgrounds, setting background to zero")
    c_background=0
    current_background=open(os.path.expanduser("~/scripts/.current_background"), 'r+')
    current_background.seek(0)
    current_background.write(str(c_background))
    current_background.truncate()

if mode=="start":
    print("You are using background number: "+str(c_background))
    print("It is the file called: "+os.path.expanduser("~/background.images")+"/"+os.listdir(os.path.expanduser("~/background.images"))[c_background]+'"')
    os.system('nitrogen --set-scaled "'+os.path.expanduser("~/background.images")+"/"+os.listdir(os.path.expanduser("~/background.images"))[c_background]+'"')
if mode=="next":
    new_background=c_background+1
    if new_background+1>number_of_backgrounds:
        print("the requested background is outside of all the possible backgrounds, setting background to zero")
        new_background=0
    print("You are using background number: "+str(new_background))
    print("It is the file called: "+os.path.expanduser("~/background.images")+"/"+os.listdir(os.path.expanduser("~/background.images"))[new_background]+'"')
    os.system('nitrogen --set-scaled "'+os.path.expanduser("~/background.images")+"/"+os.listdir(os.path.expanduser("~/background.images"))[new_background]+'"')
    current_background=open(os.path.expanduser("~/scripts/.current_background"), 'r+')
    current_background.seek(0)
    current_background.write(str(new_background))
    current_background.truncate()
if mode=="current":
    print(c_background)
