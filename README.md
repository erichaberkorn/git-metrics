# Git Metrics

## Running Locally

1. Run `./run.sh -o out.csv -r ../workflows-conductor`  to make the csv file
2. Run `sqlite3 data.sqlite < schema.sql` to setup the sqlite database
3. Run `sqlite3 data.sqlite`
4. Within the sqlite repl run `.import out.csv metrics`
5. Run queries against the `metrics` table
