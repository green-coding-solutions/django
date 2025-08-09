#!/usr/env bash


python -u /var/www/django/tests/runtests.py i18n --durations 10 --parallel 2 --verbosity 2 --noinput 2>&1 | while IFS= read -r line; do
    printf '[%s] %s\n' "$(date +%s%6N)" "$line"
    echo "$line" | awk '/Found [0-9]+ test\(s\)/ { gsub(/Found | test\(s\)/, "", $0); print "GMT_SCI_R=" $0 }'
done