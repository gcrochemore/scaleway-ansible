#!/bin/bash
CHANNEL="#vincentp-dev"
USERNAME="Slack It !"
EMOJI="slack"

usage(){ 
    echo "Usage: ./slack-it [options] message" 
    echo "-c channel : Set the channel" 
    echo "-u display name : Set the displayed name"
    echo "-e emoji: Set the emoji icon"
    echo "-h help: Show this guide"
} 

# Pas de paramètre 
[[ $# -lt 1 ]] && usage 

while true; do 
    case "$1" in 
        -h|--help) 
            usage 
            shift
            break;; 
        -c|--channel)
            CHANNEL=$2
            shift 2;;

        -d|--display-name)
            USERNAME=$2
            shift 2;;

        -e|--emoji) 
            EMOJI=$2
            shif 2;;

        *)  # fin des options 
        break;;
    esac 
done
MSG=$*

PAYLOAD="payload={\"channel\": \"$CHANNEL\", \"username\": \"$USERNAME\", \"text\": \"$MSG\", \"icon_emoji\": \"$EMOJI\"}"
curl -X POST --data-urlencode "$PAYLOAD" "$SLACK_HOOK"