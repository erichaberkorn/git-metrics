.mode csv
.separator '|'
CREATE TABLE metrics (
  "month" TEXT,
  "service" TEXT,
  "merges" INTEGER,
  "reverts" INTEGER,
  "inserts" INTEGER,
  "deletes" INTEGER
);
.import out.csv metrics
