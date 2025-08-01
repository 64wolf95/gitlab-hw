#!/bin/bash

PORT=80
FILE=/var/www/html/index.html

# Проверка порта
nc -z localhost $PORT
if [[ $? -ne 0 ]]; then
    exit 1
fi

# Проверка файла
if [[ ! -f $FILE ]]; then
    exit 1
fi

exit 0
