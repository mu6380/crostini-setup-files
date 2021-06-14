#!/bin/bash

if [ ! -d "/home/mu/latex.files/notes/biology.notes" ]
then
mkdir -p /home/mu/latex.files/notes/biology.notes
fi

if [ ! -d "/home/mu/latex.files/notes/math.notes" ]
then
mkdir -p /home/mu/latex.files/notes/math.notes
fi

if [ ! -d "/home/mu/latex.files/notes/sstudies.notes" ]
then
mkdir -p /home/mu/latex.files/notes/sstudies.notes
fi

if [ ! -d "/home/mu/latex.files/sandboxes" ]
then
mkdir -p /home/mu/latex.files/sandboxes
fi

if [ ! -d "/home/mu/latex.files/projects" ]
then
mkdir -p /home/mu/latex.files/projects
fi

############################################################

echo Where?
date=$(date | cut -d " " -f 3,2,4)
read destination

############################################################

if [ "$destination" == "biology" ];
then
echo "note folder name?"
read notefolder
cd /home/mu/latex.files/notes/biology.notes
preceding=$(echo $notefolder | awk -F "--date" '{print $1}')
succeeding=$(echo $notefolder | awk -F "--date" '{print $2}')
if [[ "$notefolder" == *"--date"* ]]
        then
        mkdir "$preceding$date$succeeding"
        cd "$preceding$date$succeeding"
        else
        mkdir "$notefolder"
        cd "$notefolder"
fi
echo "note name?"
read notename
stringname=$(echo $notename | rev | cut -d "." -f2- | rev)
preceding=$(echo $stringname | awk -F "--date" '{print $1}')
succeeding=$(echo $stringname | awk -F "--date" '{print $2}')
extension=$(echo $notename | rev | cut -d "." -f 1 | rev)
if [[ "$stringname" == *"--date"* ]]
        then
        touch "$preceding$date$succeeding.$extension"
        atom "$preceding$date$succeeding.$extension"
        else
        touch "$stringname.$extension"
        atom "$stringname.$extension"
fi
fi

############################################################

if [ "$destination" == "math" ];
then
echo "note folder name?"
read notefolder
cd /home/mu/latex.files/notes/math.notes
preceding=$(echo $notefolder | awk -F "--date" '{print $1}')
succeeding=$(echo $notefolder | awk -F "--date" '{print $2}')
if [[ "$notefolder" == *"--date"* ]]
        then
        mkdir "$preceding$date$succeeding"
        cd "$preceding$date$succeeding"
        else
        mkdir "$notefolder"
        cd "$notefolder"
fi
echo "note name?"
read notename
stringname=$(echo $notename | rev | cut -d "." -f2- | rev)
preceding=$(echo $stringname | awk -F "--date" '{print $1}')
succeeding=$(echo $stringname | awk -F "--date" '{print $2}')
extension=$(echo $notename | rev | cut -d "." -f 1 | rev)
if [[ "$stringname" == *"--date"* ]]
        then
        touch "$preceding$date$succeeding.$extension"
        atom "$preceding$date$succeeding.$extension"
        else
        touch "$stringname.$extension"
        atom "$stringname.$extension"
fi
fi

############################################################

if [ "$destination" == "sstudies" ];
then
echo "note folder name?"
read notefolder
cd /home/mu/latex.files/notes/sstudies.notes
preceding=$(echo $notefolder | awk -F "--date" '{print $1}')
succeeding=$(echo $notefolder | awk -F "--date" '{print $2}')
if [[ "$notefolder" == *"--date"* ]]
        then
        mkdir "$preceding$date$succeeding"
        cd "$preceding$date$succeeding"
        else
        mkdir "$notefolder"
        cd "$notefolder"
fi
echo "note name?"
read notename
stringname=$(echo $notename | rev | cut -d "." -f2- | rev)
preceding=$(echo $stringname | awk -F "--date" '{print $1}')
succeeding=$(echo $stringname | awk -F "--date" '{print $2}')
extension=$(echo $notename | rev | cut -d "." -f 1 | rev)
if [[ "$stringname" == *"--date"* ]]
        then
        touch "$preceding$date$succeeding.$extension"
        atom "$preceding$date$succeeding.$extension"
        else
        touch "$stringname.$extension"
        atom "$stringname.$extension"
fi
fi

############################################################

if [ "$destination" == "sandboxes" ];
then
    echo "note folder+note name?"
    read notefolder
    cd /home/mu/latex.files/sandboxes
    mkdir "$notefolder"
    cd "$notefolder"
    touch "$notefolder.tex"
    atom "$notefolder.tex"
fi

############################################################

if [ "$destination" == "projects" ];
then
echo "note folder name?"
read notefolder
cd /home/mu/latex.files/projects
preceding=$(echo $notefolder | awk -F "--date" '{print $1}')
succeeding=$(echo $notefolder | awk -F "--date" '{print $2}')
if [[ "$notefolder" == *"--date"* ]]
        then
        mkdir "$preceding$date$succeeding"
        cd "$preceding$date$succeeding"
        else
        mkdir "$notefolder"
        cd "$notefolder"
fi
echo "note name?"
read notename
stringname=$(echo $notename | rev | cut -d "." -f2- | rev)
preceding=$(echo $stringname | awk -F "--date" '{print $1}')
succeeding=$(echo $stringname | awk -F "--date" '{print $2}')
extension=$(echo $notename | rev | cut -d "." -f 1 | rev)
if [[ "$stringname" == *"--date"* ]]
        then
        touch "$preceding$date$succeeding.$extension"
        atom "$preceding$date$succeeding.$extension"
        else
        touch "$stringname.$extension"
        atom "$stringname.$extension"
fi
fi

############################################################

if [ "$destination" != "biology" ] && [ "$destination" != "math" ] && [ "$destination" != "sandboxes" ] && [ "$destination" != "sstudies" ] && [ "$destination" != "projects" ];
then
echo "wtf that's not a directory"
fi
