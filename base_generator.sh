#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2021 Kovács Norbert <mfw.kovacs.norbert@gmail.com>
#

java='public class Main {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println("Helló világ!\\n");\n\t}\n}'

cpp='#include <iostream>\n\nint main(void)\n{\n\tstd::cout << "Helló Világ!\\n";\n}'

c='#include <stdio.h>\n\nint main(){\n\tprintf("Helló Világ!\\n");\n\treturn 0;\n}'
c_header_h='#ifndef CHANGE_ME\n#define CHANGE_ME\n\nvoid example_function(int example_param);\n\n#endif'
c_header_c='#include <stdio.h>\n\nvoid example_function(int example_param)\n{\n\tprintf("Hello from header!\\n");\n}'

html='<!doctype html>\n<html lang="hu" dir="ltr">\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<link rel="stylesheet" href="master.css">\n\t\t<title>Weboldal</title>\n\t</head>\n\t<body>\n\n\t</body>\n</html>'
master='body{\n\tbackground-color: red\n}'
CNAME='change-this.surge.sh'


python='#!/usr/bin/python3\n\ndef main():\n\tprint("Helló Világ!")\n\nif __name__ == "__main__":\n\tmain()'

latex='\documentclass[a4paper,12pt]{article}\n\usepackage[T1]{fontenc}\n\PassOptionsToPackage{defaults=hu-min}{magyar.ldf}\n\usepackage[magyar]{babel}\n\\begin{document}\n\tÉkezetes szöveg.\n\\end{document}'

# Should add VueCDN project as well

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
	echo "Error: No specified project was given! Please specify a project type [java,cpp,c,web,python,latex]"
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
	echo "C# is no longer supported, please use dotnet-sdk instead."
elif [ $1 == "cpp" ];
then
	mkdir $projectname
	echo -e $cpp > $projectname/main.cpp
elif [ $1 == 'c' ];
then
	mkdir $projectname
	echo -e $c > $projectname/main.c
elif [ $1 == 'c-header' ];
then
	echo -e $c_header_h > $projectname.h
	echo -e $c_header_c > $projectname.c
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
	echo -e "Java \tcpp(c++) \tc \thtml \tpython \tlatex"
fi
