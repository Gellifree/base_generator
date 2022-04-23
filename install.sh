#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2021 Kovács Norbert <mfw.kovacs.norbert@gmail.com>
#

dir="/usr/bin"


if [ -d "$dir" ]
then
	cp base_generator.sh /usr/bin/base_generator
else
	mkdir /usr/bin
	cp base_generator.sh /usr/bin/base_generator
	echo "To finnish the installation, please restart."
fi

# Path problem with fish shell, should optimize
