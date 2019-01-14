#/usr/bin/bash

# This ASCII art script needs to be at least 119 columns wide by 21 rows tall
# for the doggos to properly be displayed. I added logic that checks
# for a terminal that can safely display the doggos.

# tput cols returns the width of the terminal
TERMINAL_WIDTH="$(tput cols)"
# tput lines returns the height of the terminal
TERMINAL_HEIGHT="$(tput lines)"

# needs to be 119 to fit dorkly() to the screen
# -lt is checking for the terminal width being less than 119 columns wide
if [[ "$TERMINAL_WIDTH" -lt 119 ]]
then
	echo "You monster! One of these doggos needs 119 characters to safely run within."	
	echo "Your terminal window is only "$TERMINAL_WIDTH" columns wide."
	echo "Resize your terminal window to at least 119 columns wide."
	# exit 1 means failure. 0 would be a success
	exit 1
fi

# bork3 is 21 characters tall
# -lt is checking if the height is less than 21 rows tall
if [[ "$TERMINAL_HEIGHT" -lt 21 ]]
then
	echo "You monster! One of these doggos needs 21 rows to display safely."	
	echo "Your terminal window is only "$TERMINAL_HEIGHT" rows tall."
	echo "Resize your terminal window to at least 21 rows tall."
	# exit 1 means failure. 0 would be a success
	exit 1
fi

bork() {

cat << 'EOF'

                             ;\ 
                            |' \ 
         _                  ; : ; 
        / `-.              /: : | 
       |  ,-.`-.          ,': : | 
       \  :  `. `.       ,'-. : | 
        \ ;    ;  `-.__,'    `-.| 
         \ ;   ;  :::  ,::'`:.  `. 
          \ `-. :  `    :.    `.  \ 
           \   \    ,   ;   ,:    (\ 
            \   :., :.    ,'o)): ` `-. 
           ,/,' ;' ,::"'`.`---'   `.  `-._ 
         ,/  :  ; '"      `;'          ,--`. 
        ;/   :; ;             ,:'     (   ,:) 
          ,.,:.    ; ,:.,  ,-._ `.     \""'/ 
          '::'     `:'`  ,'(  \`._____.-'"' 
             ;,   ;  `.  `. `._`-.  \\ 
             ;:.  ;:       `-._`-.\  \`. 
              '`:. :        |' `. `\  ) \ 
      -hrr-      ` ;:       |    `--\__,' 
                   '`      ,' 
                        ,-' 
 
EOF

}



bork2() {

cat << 'EOF'

               
                ,.  | \ 
               |: \ ; :\ 
               :' ;\| ::\ 
                \ : | `::\ 
                _)  |   `:`. 
              ,' , `.    ;: ; 
            ,' ;:  ;"'  ,:: |_ 
           /,   ` .    ;::: |:`-.__ 
        _,' _o\  ,::.`:' ;  ;   . ' 
    _,-'           `:.          ;""\, 
 ,-'                     ,:         `-;, 
 \,                       ;:           ;--._ 
  `.______,-,----._     ,' ;:        ,/ ,  ,` 
         / /,-';'  \     ; `:      ,'/,::.::: 
       ,',;-'-'_,--;    ;   :.   ,',',;:::::: 
      ( /___,-'     `.     ;::,,'o/  ,::::::: 
       `'             )    ;:,'o /  ;"-   -:: 
                      \__ _,'o ,'         ,:: 
                         ) `--'       ,..:::: 
      -hrr-              ; `.        ,::::::: 
                          ;  ``::.    ::::::: 


EOF


}




bork3() {

cat << 'EOF'
         ____,'`-, 
      _,--'   ,/::.; 
   ,-'       ,/::,' `---.___        ___,_ 
   |       ,:';:/        ;'"`;"`--./ ,-^.;--. 
   |:     ,:';,'         '         `.   ;`   `-. 
    \:.,:::/;/ -:.                   `  | `     `-. 
     \:::,'//__.;  ,;  ,  ,  :.`-.   :. |  ;       :. 
      \,',';/O)^. :'  ;  :   '__` `  :::`.       .:' ) 
      |,'  |\__,: ;      ;  '/O)`.   :::`;       ' ,' 
           |`--''            \__,' , ::::(       ,' 
           `    ,            `--' ,: :::,'\   ,-' 
            | ,;         ,    ,::'  ,:::   |,' 
            |,:        .(          ,:::|   ` 
            ::'_   _   ::         ,::/:| 
           ,',' `-' \   `.      ,:::/,:| 
          | : _  _   |   '     ,::,' ::: 
          | \ O`'O  ,',   ,    :,'   ;:: 
           \ `-'`--',:' ,' , ,,'      :: 
            ``:.:.__   ',-','        ::' 
    -hrr-      `--.__, ,::.         ::' 
                   |:  ::::.       ::' 
                   |:  ::::::    ,::' 




EOF


}

bork4() {

cat << 'EOF'
                    ___           ___           ___     
     _____         /\  \         /\  \         /|  |    
    /::\  \       /::\  \       /::\  \       |:|  |    
   /:/\:\  \     /:/\:\  \     /:/\:\__\      |:|  |    
  /:/ /::\__\   /:/  \:\  \   /:/ /:/  /    __|:|  |    
 /:/_/:/\:|__| /:/__/ \:\__\ /:/_/:/__/___ /\ |:|__|____
 \:\/:/ /:/  / \:\  \ /:/  / \:\/:::::/  / \:\/:::::/__/
  \::/_/:/  /   \:\  /:/  /   \::/~~/~~~~   \::/~~/~    
   \:\/:/  /     \:\/:/  /     \:\~~\        \:\~~\     
    \::/  /       \::/  /       \:\__\        \:\__\    
     \/__/         \/__/         \/__/         \/__/    


EOF

}

d() {

cat << 'EOF'
             .--~~,__
:-....,-------`~~'._.'
 `-,,,  ,_      ;'~U'
  _,-' ,'`-__; '--.
 (_/'~~      ''''(;


EOF

}


d1() {

cat << 'EOF'
             	     .--~~,__
	:-....,-------`~~'._.'
 	 `-,,,  ,_      ;'~U'
  	  _,-' ,'`-__; '--.
 	 (_/'~~      ''''(;


EOF

}
dor() {

cat << 'EOF'
             	     	     	     .--~~,__
			:-....,-------`~~'._.'
 	 	 	 `-,,,  ,_      ;'~U'
  	  	  	  _,-' ,'`-__; '--.
 	 	 	 (_/'~~      ''''(;


EOF

}

dork() {

cat << 'EOF'
             	     	     	     	     	     .--~~,__
					:-....,-------`~~'._.'
 	 	 	 	 	 `-,,,  ,_      ;'~U'
  	  	  	  	  	  _,-' ,'`-__; '--.
 	 	 	 	 	 (_/'~~      ''''(;


EOF

}

dorkl() {

cat << 'EOF'
             	     	     	     	     	     	     	     	     .--~~,__
								:-....,-------`~~'._.'
 	 	 	 	 	 	 	 	 `-,,,  ,_      ;'~U'
  	  	  	  	  	  	  	  	  _,-' ,'`-__; '--.
 	 	 	 	 	 	 	 	 (_/'~~      ''''(;


EOF

}

dorkly() {

cat << 'EOF'
             	     	     	     	     	     	     	     	     	     	     	     	     .--~~,__
												:-....,-------`~~'._.'
 	 	 	 	 	 	 	 	 	 	 	 	 `-,,,  ,_      ;'~U'
  	  	  	  	  	  	  	  	  	  	  	  	  _,-' ,'`-__; '--.
 	 	 	 	 	 	 	 	 	 	 	 	 (_/'~~      ''''(;


EOF

}



bork
sleep 1 
clear
bork2
sleep 1
clear
bork3
sleep 1
clear
bork4
sleep 2
clear
d
sleep 1
clear
d1
sleep 1
clear
dor
sleep 1
clear
dork
sleep 1
clear
dorkl
sleep 1
clear
dorkly
sleep 1
clear
