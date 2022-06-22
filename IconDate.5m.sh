#!/bin/bash

# <xbar.title>Date in Icon</xbar.title>
# <xbar.version>v1.2</xbar.version>
# <xbar.author>Napx Leong</xbar.author>
# <xbar.author.github>napxiscoding</xbar.author.github>
# <xbar.desc>IconDate shows date in icon on the menu bar.</xbar.desc>
# <xbar.image>https://raw.githubusercontent.com/napxiscoding/IconDate/main/xbar-preview.png</xbar.image>
# <xbar.dependencies>bash</xbar.dependencies>
# <xbar.abouturl>https://github.com/napxiscoding</xbar.abouturl>
# Originally CalendarLite @WeibingChen https://github.com/WeibingChen17/
# Thanks @glyphrstudio https://www.glyphrstudio.com/ providing FREE font making service online.
# I know basic coding only. Please help optimizing below codes.



# !!! install fonts to work:
# !!! Calr3: https://github.com/napxiscoding/IconDate/raw/main/Calr3-Regular.otf
# Supplimental Clar3_alt: https://github.com/napxiscoding/IconDate/raw/main/Calr3-Alt.otf



dd=$(date +%_d)
icon="Calr3"
# icon="Calr3-Alt"

if [ $dd -lt 10 ]
then
    sdate="$dd"
else
    if [ $dd -eq 10 ] 
    then
        sdate='A'
    fi
    if [ $dd -eq 11 ] 
    then
        sdate='B'
    fi
    if [ $dd -eq 12 ] 
    then
        sdate='C'
    fi
        if [ $dd -eq 13 ] 
    then
        sdate='D'
    fi
        if [ $dd -eq 14 ] 
    then
        sdate='E'
    fi
        if [ $dd -eq 15 ] 
    then
        sdate='F'
    fi
        if [ $dd -eq 16 ] 
    then
        sdate='G'
    fi
        if [ $dd -eq 17 ] 
    then
        sdate='H'
    fi
        if [ $dd -eq 18 ] 
    then
        sdate='I'
    fi
        if [ $dd -eq 19 ] 
    then
        sdate='J'
    fi
        if [ $dd -eq 20 ] 
    then
        sdate='K'
    fi
        if [ $dd -eq 21 ] 
    then
        sdate='L'
    fi
        if [ $dd -eq 22 ] 
    then
        sdate='M'
    fi
        if [ $dd -eq 23 ] 
    then
        sdate='N'
    fi
        if [ $dd -eq 24 ] 
    then
        sdate='O'
    fi
        if [ $dd -eq 25 ] 
    then
        sdate='P'
    fi
    if [ $dd -eq 26 ] 
    then
        sdate='Q'
    fi
    if [ $dd -eq 27 ] 
    then
        sdate='R'
    fi
    if [ $dd -eq 28 ] 
    then
        sdate='S'
    fi
    if [ $dd -eq 29 ] 
    then
        sdate='T'
    fi
    if [ $dd -eq 30 ] 
    then
        sdate='U'
    fi
        if [ $dd -eq 31 ] 
    then
        sdate='V'
    fi
fi

timen=$(date +%T)
echo "$sdate | size=40 font=$icon"

echo "---"

font="Menlo"
color="black"

cal |awk 'NF'|while IFS= read -r i; do echo " $i"|perl -pe '$b="\b";s/ _$b(\d)_$b(\d) /(\1\2)/' |perl -pe '$b="\b";s/_$b _$b(\d) /(\1)/' |sed 's/ *$//' |sed "s/$/|trim=false font=$font color=$color/"; done 

echo "---"
next_month=$(date -v+1m +%m)
next_year=$(date -v+1m +%Y)
next_month_name=$(date -jf %Y-%m-%d "$next_year"-"$next_month"-01 '+%b')

echo "Next Month"
cal -d "$next_year"-"$next_month" | awk 'NF'|sed 's/ *$//' | while IFS= read -r i; do echo "--$i|trim=false font=$font";done
