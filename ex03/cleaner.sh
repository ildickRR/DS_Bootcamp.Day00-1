#!/bin/sh


INPUT_FILE="hh.csv"
OUTPUT_FILE="hh_positions.csv"


head -n 1 "$INPUT_FILE" > "$OUTPUT_FILE"


tail -n +2 "$INPUT_FILE" | awk -F',' 'BEGIN{OFS=","} {
    id=$1
    created_at=$2
    name=$3
    has_test=$4
    url=$5

    # По умолчанию уровень не найден
    level = "-"

    # Проверяем на все возможные варианты (англ/рус)
    if (name ~ /[Jj]unior|Младший/) level = "Младший"
    if (name ~ /[Mm]iddle|Средний/) {
        if (level == "-") level = "Средний"
        else level = level "/" "Средний"
    }
    if (name ~ /[Ss]enior|Старший/) {
        if (level == "-") level = "Старший"
        else level = level "/" "Старший"
    }

    # Печатаем строку с теми же 5 полями, только name заменён на уровень
    print id, created_at, "\""level"\"", has_test, url
}' >> "$OUTPUT_FILE"
