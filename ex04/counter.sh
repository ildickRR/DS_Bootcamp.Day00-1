#!/bin/sh

INPUT_FILE="hh_positions.csv"
OUTPUT_FILE="hh_uniq_positions.csv"

# Добавляем заголовок
echo "name,count" > "$OUTPUT_FILE"

# Пропускаем заголовок исходного файла, извлекаем 3-й столбец (name),
# сортируем, считаем уникальные значения и сортируем по количеству (по убыванию)
tail -n +2 "$INPUT_FILE" | \
awk -F',' '{print $3}' | \
sort | uniq -c | \
sort -r -n | \
awk '{print $2","$1}' >> "$OUTPUT_FILE"
