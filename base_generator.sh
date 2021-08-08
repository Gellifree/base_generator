#!/bin/bash

java='public class Main {\n\t public static void main(String[] args) {\n\t \t System.out.println("Helló világ!");\n\t	}\n}'

csharp='namespace HelloWorld\n{\n\t class Hello{\n\t \t static void Main(string[] args)\n\t \t {\n\t \t \t System.Console.WriteLine("Helló Világ!");\n\t \t }\n\t }\n}'

vala='class Demo.HelloWorld : Glib.Object {\n\n\tpublic static int main(string[] args) {\n\n\t\tstdout.printf("Hello, World!\\n");\n\n\t\treturn 0;\n\t}\n}'

cpp='#include <iostream>\n\nint main(void)\n{\n\tstd::cout << "Helló Világ!\\n";\n}'

html='<!doctype html>\n<html lang="hu" dir="ltr">\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<link rel="stylesheet" href="master.css">\n\t\t<title>Weboldal</title>\n\t</head>\n\t<body>\n\n\t</body>\n</html>'
master='body{\n\tbackground-color: red\n}'

if [ $1 == "python" ];
then
	echo "print('helló világ')" > test.py
elif [ $1 == "java" ];
then
	echo -e $java  > Main.java
elif [ $1 == "c#" ];
then
	echo -e $csharp > program.cs
elif [ $1 == "cpp" ];
then
	mkdir cpp-proj
	echo -e $cpp > cpp-proj/main.cpp
elif [ $1 == "vala" ];
then
	mkdir valaproject
	echo -e $vala > valaproject/hello.vala
elif [ $1 == "web" ];
then
	mkdir web
	echo -e $html > web/index.html
	echo -e $master > web/master.css
	echo "script base" > web/main.js
	echo "change-this.surge.sh" > web/CNAME
fi
