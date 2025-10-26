#!/bin/sh

INPUT_FILE="hh.json"
OUTPUT_FILE="hh.csv"

{
  echo '"id","created_at","name","has_test","alternate_url"'
  jq -r -f filter.jq "$INPUT_FILE"
} > "$OUTPUT_FILE"

echo "Файл $OUTPUT_FILE успешно создан с заголовком."
