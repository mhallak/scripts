##################################
#  setaf = set ansi foreground color
#  setab = set ansi background color
########################################
echo "To see the basic 8 colors:"
echo "Foreground:"
printf '\e[%sm▒' {30..37} 0; echo
echo "Background:"
printf '\e[%sm ' {40..47} 0; echo

echo "To see the extended 256 colors:"
printf '\e[48;5;%dm ' {0..255}; printf '\e[0m \n'

echo "More at:https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes"


#echo "Also:"
#for c in {0..255}; do tput setaf $c; tput setaf $c | cat -v; echo =$c; done
