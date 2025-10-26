#!/bin/sh

INPUT_FILE="hh.csv"
OUTPUT_FILE="hh_sorted.csv"

head -n 1 "$INPUT_FILE" > "$OUTPUT_FILE"

tail -n +2 "$INPUT_FILE" | sort -t',' -k2,2 -k1,1 >> "$OUTPUT_FILE"

echo "Файл $OUTPUT_FILE успешно создан и отсортирован."
