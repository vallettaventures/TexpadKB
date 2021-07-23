#!/bin/bash
# Texpad system diagnostic script
# Copyright Valletta Ventures (UK) Ltd 2013-2020

# To use:
# - Copy this script to the desktop
# - Open the Terminal app
# - Execute bash ~/Desktop/texpad-system-diagnostics.sh
# The results will be placed in the file ~/Desktop/texpad-system-diagnostics-report.txt

OUTPUTNAME=~/Desktop/texpad-system-diagnostics-report.txt

# useful functions

whichtest () {
    echo which $1 >> $OUTPUTNAME
    which $1 >> $OUTPUTNAME
    echo >> $OUTPUTNAME
}

inspectdir () {
    echo ls -al $1 >> $OUTPUTNAME
    ls -al $1 >> $OUTPUTNAME
    echo >> $OUTPUTNAME
}

header () {
    echo >> $OUTPUTNAME
    echo >> $OUTPUTNAME
    echo -- $1 >> $OUTPUTNAME
    echo ------------------------------ >> $OUTPUTNAME
}

# Tell the user we are starting

echo Writing report to $OUTPUTNAME ...

#
# Header
#

echo Texpad system diagnostic report > $OUTPUTNAME
date >> $OUTPUTNAME
echo user = `whoami` >> $OUTPUTNAME
echo host = `hostname` >> $OUTPUTNAME
echo >> $OUTPUTNAME


#
# Path information
#
header "Path information"

echo bash path = $PATH >> $OUTPUTNAME
echo launch control path = `launchctl getenv PATH` >> $OUTPUTNAME


#
# List various directories
#
header "Distribution information"

# important directories
inspectdir /usr/texbin
inspectdir /usr/texbin/
inspectdir /usr/local/texlive
inspectdir /usr/local/texlive/2030
inspectdir /usr/local/texlive/2029
inspectdir /usr/local/texlive/2028
inspectdir /usr/local/texlive/2027
inspectdir /usr/local/texlive/2026
inspectdir /usr/local/texlive/2025
inspectdir /usr/local/texlive/2024
inspectdir /usr/local/texlive/2023
inspectdir /usr/local/texlive/2022
inspectdir /usr/local/texlive/2021
inspectdir /usr/local/texlive/2020
inspectdir /usr/local/texlive/2019
inspectdir /usr/local/texlive/2018
inspectdir /usr/local/texlive/2017
inspectdir /usr/local/texlive/2016
inspectdir /usr/local/texlive/2015
inspectdir /usr/local/texlive/2014
inspectdir /usr/local/texlive/2013
inspectdir /usr/local/texlive/2012
inspectdir /usr/local/texlive/2011
inspectdir /usr/local/texlive/2010
inspectdir /usr/local/texlive/2009
inspectdir /usr/local/texlive/2008
inspectdir /usr/local/texlive/2007
inspectdir /usr/local/texlive/2006
inspectdir /Library/TeX
inspectdir /Library/TeX/Distributions/.DefaultTeX/Contents/Programs/
inspectdir /usr/local/bin
inspectdir /usr/bin
inspectdir /opt/local/bin
inspectdir /opt
inspectdir /usr/local/Cellar

# important executables
whichtest latex
whichtest tex
whichtest perl
whichtest python
whichtest xetex
whichtest xelatex
whichtest xdv2pdf
whichtest xdvi
whichtest xdvi-xaw
whichtest xdvipdfmx
whichtest platex
whichtest bibtex
whichtest biblatex
whichtest pdflatex
whichtest ps2pdf
whichtest dvips
whichtest makeindex
whichtest dvipdf
whichtest dvipdfm
whichtest dvipdfmx

#
# Get Texpad preferences and plist
#
header "Texpad preferences"
defaults read com.vallettaventures.Texpad  >> $OUTPUTNAME
header "Texpad Info.plist"
cat /Applications/Texpad.app/Contents/Info.plist >> $OUTPUTNAME

#
# Tell the user we are finished
#
cat $OUTPUTNAME | pbcopy
echo ...finished, report has been copied to the clipboard, please email it back to support@vallettaventures.com
