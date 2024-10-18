#!/bin/bash

# Gannon University Unix Lab 6 - Find command

# This file is a shell script. It's essentially a program comprised
# of Linux commands as functions. You can run shell scripts as an executable:
# ./lab6.sh
# Be sure to enable execute permissions for this file in order to execute it:
# chmod a+x lab5.sh

# Just like a C program, the shell will start from the top and start executing commands.
# Later you will make our own scripts - in addition to what we've covered so far, shell scripts
# can also implement variables, control structures such as if statements and loops, and more! 
# What we've been using (the command line) is simply a runtime interpreter for this 'language'.
# This script is very simple - it just runs commands, one after another, to create the directory structure for this lab.
# Scripts like these are still useful to automate a tedious process, such as this.

# This script creates the file directory hierarchy for lab 6. It also makes some "large" files using fallocate,
# writes some basic content to the files and sets some permissions for specific find commands.

# You can analyze this script to figure out what the outputs of your
# find commands should be. Use this information to check your answers.
mkdir -p allmonths/FirstSemester ; mkdir allmonths/SecondSemester
cd allmonths

# fallocate - works the same as touch, but can be used to create artifically large files.
# It fills the file with the specified number of bytes set to all zeros. (null terminators in ASCII)
# Usage: $ fallocate -l [filesize] [filename]. 
# fallocate -l 4K january.txt
# fallocate -l 2M june.txt
# fallocate -l 56K NOVEMBER.TXT

# Above are a few examples of the use of the comamnd fallocate, however some Linux enviroments 
# prevent the use of this command, such as bellard.org/jslinux. If that is the case we will use an
# alternative with the dd command that will also create arificially large files as shown below.

time dd if=/dev/zero of=january.txt bs=1K seek=4 count=0
time dd if=/dev/zero of=june.txt bs=1M seek=2 count=0
time dd if=/dev/zero of=NOVEMBER.TXT bs=2K seek=28 count=0

# Create and put some content in the files
echo "January - We start the year off fine" >> january.txt
echo "February - I forgot what happened in January, must have been a blur." > february.txt
echo "March - we all went online!" > march.txt
echo "April - studying for finals :(" > april.txt
echo "May - Finally done YAY!" > may.txt
echo "June - June gloom in solitude" >> june.txt
echo "July - Went to the pool today. Just kidding, we had to be safe" > july.txt
echo "AUGUST - I FOUND THE CAPS LOCK BUTTON" > AUGUST.TXT
echo "SEPTEMBER - Back to school. This is where we're at now!" > SEPTEMBER.TXT
echo "OCTOBER - Gonna get some pumpkins ^_^" > OCTOBER.TXT
echo "NOVEMBER - Merry chr- oh wait, not yet." >> NOVEMBER.TXT
echo "DECEMBER - Christmas time! ho ho ho" > DECEMBER.TXT

cp *.txt FirstSemester ; cp *.TXT SecondSemester

# set the file creation date to something different
touch -t 201901011200 march.txt FirstSemester/january.txt OCTOBER.TXT

# change around file permissions
chmod 0775 FirstSemester
chmod 0755 SecondSemester
chmod 0664 *.* FirstSemester/*.* SecondSemester/*.*
chmod 0644 SEPTEMBER.TXT DECEMBER.TXT OCTOBER.TXT SecondSemester/SEPTEMBER.TXT

echo "Laboratory 6 initialization complete!"