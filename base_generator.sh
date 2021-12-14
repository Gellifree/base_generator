#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2021 Kovács Norbert <mfw.kovacs.norbert@gmail.com>
#

java='public class Main {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println("Helló világ!\\n");\n\t}\n}'

csharp='using System;\n\nnamespace HelloWorld\n{\n\t class Hello{\n\t \t static void Main(string[] args)\n\t \t {\n\t \t \t Console.WriteLine("Helló Világ!");\n\t \t }\n\t }\n}'

vala='public static int main(string[] args) {\n\n\tstdout.printf("Hello, World!\\n");\n\n\treturn 0;\n}'

cpp='#include <iostream>\n\nint main(void)\n{\n\tstd::cout << "Helló Világ!\\n";\n}'

c='#include <stdio.h>\n\nint main(){\n\tprintf("Helló Világ!\\n");\n\treturn 0;\n}'

html='<!doctype html>\n<html lang="hu" dir="ltr">\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<link rel="stylesheet" href="master.css">\n\t\t<title>Weboldal</title>\n\t</head>\n\t<body>\n\n\t</body>\n</html>'
master='body{\n\tbackground-color: red\n}'
CNAME='change-this.surge.sh'


python='#!/usr/bin/python3\n\ndef main():\n\tprint("Helló Világ!")\n\nif __name__ == "__main__":\n\tmain()'

latex='\documentclass[a4paper,12pt]{article}\n\usepackage[T1]{fontenc}\n\PassOptionsToPackage{defaults=hu-min}{magyar.ldf}\n\usepackage[magyar]{babel}\n\\begin{document}\n\tÉkezetes szöveg.\n\\end{document}'

if [ -z "$2" ];
then
	#echo "second param is empty"
	projectname=$1
else
	#echo "second param is not empty"
	projectname=$2
fi

#echo $projectname

if [ -z "$1" ];
then
	echo "Error: No specified project was given!"
elif [ $1 == "null" ];
then
	echo "Error: project type can't be null!"
elif [ $1 == "python" ];
then
	mkdir $projectname
	echo -e $python > $projectname/main.py
	chmod +x $projectname/main.py
elif [ $1 == "java" ];
then
	mkdir $projectname
	echo -e $java  > $projectname/Main.java
elif [ $1 == "csharp" ];
then
	mkdir $projectname
	echo -e $csharp > $projectname/program.cs
elif [ $1 == "cpp" ];
then
	mkdir $projectname
	echo -e $cpp > $projectname/main.cpp
elif [ $1 == 'c' ];
then
	mkdir $projectname
	echo -e $c > $projectname/main.c
elif [ $1 == "vala" ];
then
	mkdir $projectname
	echo -e $vala > $projectname/hello.vala
elif [ $1 == "latex" ];
then
	mkdir $projectname
	echo -e $latex > $projectname/document.tex
elif [ $1 == "web" ];
then
	mkdir $projectname
	echo -e $html > $projectname/index.html
	echo -e $master > $projectname/master.css
	echo $CNAME > $projectname/CNAME
else
	echo "Error: Project type is not found."
	echo -e "Available projects:\n"
	echo -e "Java \tCsharp \tcpp \tc \thtml \tpython \tlatex"
fi
