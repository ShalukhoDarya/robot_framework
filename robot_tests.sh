#!/bin/bash

mkdir -p results/chrome
mkdir -p results/firefox

pabot --processes 1 -v BROWSER:chrome -V chrome_args.txt --outputdir results/chrome tests
pabot --processes 1 -v BROWSER:firefox -V firefox_args.txt --outputdir results/firefox tests


