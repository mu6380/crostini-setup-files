import os
import time
from os.path import expanduser
from datetime import date

subject_dictionary = {
  "biology": ["/latex.files/notes/biology.notes", "normal"],
  "math": ["/latex.files/notes/math.notes", "normal"],
  "sstudies": ["/latex.files/notes/sstudies.notes", "normal"],
  "physics": ["/latex.files/notes/physics.notes", "normal"],
  "sandboxes": ["/latex.files/sandboxes", "other"],
  "projects": ["/latex.files/projects", "other"],
  "chemistry": ["/latex.files/notes/chemistry.notes", "normal"],
}

home = expanduser("~")

# make all the needed subject_directories
for x in subject_dictionary.keys():
    fulldir=home+subject_dictionary[x][0]
    if os.path.isdir(fulldir) == False:
        print("Made directory: "+fulldir)
        os.makedirs(fulldir)

date=date.today().strftime("%Y-%d-%m")
subject=input("Where will the note be?\n")
extension=""

# check if subject names are valid
if subject in subject_dictionary:
    # define the procedure type for which the note will be made with
    print("Nice job, it's a real location.")
else:
    print("wtf that's not a location")
    exit()

if subject_dictionary[subject][1] == "normal":
    
    foldername=input("Note folder name?\n")
    notename=input("Note name?\n")

    foldername=foldername.replace("--date", date)
    notename=notename.replace("--date", date)

    if "." not in notename:
        extension=".tex"
    notefolder=home+subject_dictionary[subject][0]+'/'+foldername
    os.makedirs(notefolder)
    open(notefolder+"/"+notename+extension, 'x')
    os.system("atom "+'"'+notefolder+"/"+notename+extension+'"')

    print("Made directory: "+notefolder)
    print("Made note: "+notename+extension)

if subject_dictionary[subject][1] == "other":
    note_and_folder_name=input("Note and folder name?\n")

    if "." not in note_and_folder_name:
        extension=".tex"
    notefolder=home+subject_dictionary[subject][0]+'/'+note_and_folder_name
    os.makedirs(notefolder)
    open(notefolder+"/"+note_and_folder_name+extension, 'x')
    os.system('atom '+'"'+notefolder+"/"+note_and_folder_name+extension+'"')

    print("Made directory: "+notefolder)
    print("Made note: "+note_and_folder_name+extension)
