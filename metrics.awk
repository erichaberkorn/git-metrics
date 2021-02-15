BEGIN {
  FS = ",";
}

match($2, /^Merge pull request /) {
  acc[substr($1, 0, 7)]["merges"] += 1
}

match($2, /^Revert "/) {
  acc[substr($1, 0, 7)]["reverts"] += 1
}

match($4, /([0-9]+) insertions/, c) {
  acc[substr($1, 0, 7)]["inserts"] += c[1]
}

match($5, /([0-9]+) deletions/, d) {
  acc[substr($1, 0, 7)]["deletes"] += d[1]
}

END {
  for (a in acc) {
    merges = (acc[a]["merges"] ? acc[a]["merges"] : 0)
    reverts = (acc[a]["reverts"] ? acc[a]["reverts"] : 0)
    insertions = (acc[a]["inserts"] ? acc[a]["inserts"] : 0)
    deletions = (acc[a]["deletes"] ? acc[a]["deletes"] : 0)
    print a "|"  service "|" merges "|" reverts "|" insertions "|" deletions
  }
}
