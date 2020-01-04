#!/bin/bash


(( height=$(tput lines) ))
(( width=$(tput cols) ))

fr=3
lr=21
fc=10
lc=50

setborder() {
	
	tput setaf 7
	tput cup $fr $fc
	(( x = $fc ))
	# top
	while [ $x -le $lc ];do
		echo -n "#"
		(( x=x+1 ))

	done
	
	 #sides
	 (( y=$fr ))
	 while [ $y -le $lr ];do
	 	tput cup $y $fc; echo -n "#"
	 	tput cup $y $lc; echo -n "#"
	 	(( y=y+1 ))

	 done

	 #bottom
	 tput cup $lr $fc
	 (( y=$fc ))
	 while [ $y -le $lc ];do
	 	echo -n "#"
	 	(( y=y+1 ))
	 done
	
}


 setmiddle() {
#tput setaf 7
(( midr=(fr+lr)/2 ))
(( midc=(fc+lc)/2 ))

tput cup $midr $midc
echo -n "*"
(( cur_x=midr ))
(( cur_y=midc ))

 }

moveup () {
(( newx=cur_x-1 ))
if [ $newx -gt $fr ];then
tput cup $newx $cur_y
echo -n "*"
(( cur_x=newx ))
fi
if [ $newx -eq $fr ];then
	clear
	setborder
	setmiddle
fi
}

movdown () {
(( newd=cur_x+1 ))
if [ $newd -lt $lr ];then
tput cup $newd $cur_y
echo -n "*"
(( cur_x=newd ))
fi

if [ $newd -eq $lr ];then
	clear
	setborder
	setmiddle
fi
}

movleft () {
	#echo "enter"
(( newl=cur_y-1 ))
if [ $newl -gt $fc ];then
tput cup $cur_x $newl
echo -n "*"
(( cur_y=newl ))
fi

if [ $newl -eq $fc ];then
	clear
	setborder
	setmiddle
fi
}

movright () {
	#echo "enter"
(( newr=cur_y+1 ))
if [ $newr -lt $lc ];then
tput cup $cur_x $newr
echo -n "*"
(( cur_y=newr ))

fi

if [ $newr -eq $lc ];then
	clear
	setborder
	setmiddle
fi

}

clear
#stty -echo
#tput civis
setborder
setmiddle
(( cur_x=midr ))
(( cur_y=midc ))

tput civis 

read -s -n1 ch
((randcolor=RANDOM%256 ))
tput setaf $randcolor
if [ "$ch" == "u" ];then
	flag=1
elif [ "$ch" == "d" ];then
	flag=2
elif [ "$ch" == "l" ];then
	flag=3
elif [ "$ch" == "r" ];then
	flag=4
fi
while true
do
	
	
	if [ "$ch" == "u" ];then

	if [ $flag -ne 1 ];then
		((randcolor=RANDOM%256 ))
		tput setaf $randcolor
		flag=1
	fi

		moveup 
		while true 
		do
			read -s -t 1 -n 1 ch
			if [ $? == 0 ]; then
			break
			else
				moveup
			fi
		done
	

	elif [ "$ch" == "d" ];then
		if [ $flag -ne 2 ];then
		((randcolor=RANDOM%256 ))
		tput setaf $randcolor
		flag=2
	fi
		movdown
		while true 
		do
			read -s -t 1 -n 1 ch
			if [ $? == 0 ]; then
			break
			else
				movdown
			fi
		done

	

	elif [ "$ch" == "l" ];then
		if [ $flag -ne 3 ];then
		((randcolor=RANDOM%256 ))
		tput setaf $randcolor
		flag=3
	fi
		movleft
		while true 
		do
			read -s -t 1 -n 1 ch
			if [ $? == 0 ]; then
			break
			else
				movleft
			fi
		done
	

	elif [ "$ch" == "r" ];then
		if [ $flag -ne 4 ];then
		((randcolor=RANDOM%256 ))
		tput setaf $randcolor
		flag=4
	fi
		movright
		while true 
		do
			read -s -t 1 -n 1 ch
			if [ $? == 0 ]; then
			break
			else
				movright
			fi
		done
	elif [ "$ch" == "q" ];then

		(( next=lr+10 ))
		tput cvvis
		tput cup $next 0
		exit

	fi


done 


tput cvvis
tput cup $next 0 
echo
echo 

 
#tput reset

#read val

