#!/bin/sh

awk '
BEGIN { 
    print "\"id\",\"created_at\",\"name\",\"has_test\",\"alternate_url\""
}
NR>1 && $0!="" && !seen[$0]++ {
    print
}
' hh_positions.csv > hh_positions_concat.csv
