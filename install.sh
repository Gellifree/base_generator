#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2021 Kovács Norbert <mfw.kovacs.norbert@gmail.com>
#

dir="$HOME/bin"


if [ -d "$dir" ]
then
	cp base_generator.sh ~/bin/base_generator.sh
else
	mkdir ~/bin
	cp base_generator.sh ~/bin/base_generator
	echo "To finnish the installation, please restart."
fi

