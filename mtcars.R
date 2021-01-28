library(tidyverse)
library(reticulate)

# Create a connection ("con") to a database file:
con <- DBI::dbConnect(RSQLite::SQLite(), "mtcars.sqlite3")

# Write `mtcars` to a database
DBI::dbWriteTable(con, "mtcars", mtcars)

# Disconnect from our database
DBI::dbDisconnect(con)