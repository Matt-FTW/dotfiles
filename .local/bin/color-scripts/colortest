#!/usr/bin/env bash

#   Daniel Crisman's ANSI color chart script from
#   The Bash Prompt HOWTO: 6.1. Colours
#   http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
#  
#   This function echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a 
#   test use of that color on all nine background 
#   colors (default + 8 escapes).
 
    T='•••'   # The text for the color test
    
    echo -e "\n         def     40m     41m     42m     43m     44m     45m     46m     47m";
    
    for FGs in '    m' '   1m' '  30m' '1;90m' '  31m' '1;91m' '  32m' \
               '1;92m' '  33m' '1;93m' '  34m' '1;94m' '  35m' '1;95m' \
               '  36m' '1;96m' '  37m' '1;97m';
    
      do FG=${FGs// /}
      echo -en " $FGs \033[$FG  $T  "
      
      for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
      done
      echo;
    done
    echo
