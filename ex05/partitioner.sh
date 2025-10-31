#!/bin/sh

awk -F',' '
NR>1 {
    match($2, /"([0-9]{4}-[0-9]{2}-[0-9]{2})/, arr)
    file = arr[1] ".csv"
    if (!(file in seen)) {
        print "\"id\",\"created_at\",\"name\",\"has_test\",\"alternate_url\"" > file
        seen[file]=1
    }
    print $0 >> file
}' hh_positions.csv
