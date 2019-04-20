#!/bin/bash

#tell a random chucknorris joke
  echo
  YELLOW='\033[03;93m'
  VALUE=$((1+ RANDOM % 3))

  echo
  case $VALUE in
    1)
    echo $(curl -s --request GET --url 'https://api.chucknorris.io/jokes/random' --header 'accept: (app  lication/json|text/plain)' | python -c 'import sys, json; print "\n\n"+json.load(sys.stdin)["value"]+  "\n\n"') | cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\n' | gshuf -n 1) | lolcat
      ;;
    2)
    echo $(curl -s -H "Accept: application/json" https://icanhazdadjoke.com/ | python -c 'import sys, json  ; print "\n\n"+json.load(sys.stdin)["joke"]+"\n\n"') | cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\  n' | gshuf -n 1) | lolcat
      ;;
    3)
      echo $(fortune | cowsay -f $(cowsay -l | tail -n +2 | tr ' ' '\n' | gshuf -n 1) | lolcat)
      ;;
  esac
  echo
