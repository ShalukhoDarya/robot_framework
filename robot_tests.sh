#!/bin/bash

# Создаем директории для результатов
mkdir -p 03_results/chrome
mkdir -p 03_results/firefox

# Запускаем тесты для Chrome
pabot --processes 1 -v BROWSER:chrome -V chrome_args.txt --outputdir 03_results/chrome 02_tests

# Запускаем тесты для Firefox
pabot --processes 1 -v BROWSER:firefox -V firefox_args.txt --outputdir 03_results/firefox 02_tests


