#!/bin/sh
vac="data+scientist"

curl -s "https://api.hh.ru/vacancies?text=$vac&per_page=20" | jq . > hh.json

echo "Результат сохранён в hh.json"
