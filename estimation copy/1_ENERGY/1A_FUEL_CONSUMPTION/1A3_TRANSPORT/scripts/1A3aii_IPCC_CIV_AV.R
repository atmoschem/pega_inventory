# IPCC
# 1: Energy
# 1.A Fuel Combustion Activities
# 1.A.3 - IPCC Transport
# 1.A.3.a - Civil Aviation\n"
# 1.A.3.a - Civil Aviation\n1.A.3.a.i - International Aviation (International Bunkers)\n1.A.3.a.ii - Domestic Aviation\n"
# 1.A.3.a - Civil Aviation\n1.A.3.a.ii - Domestic Aviation\n"
# "1.A.3.a.i - International Aviation (International Bunkers)\n"

library(data.table)
library(pega)

# database
db <- ef(returnfdb = T)

db[,
  grep("1.A.3", code, value = T)
] |>
  unique()

# database final
db[
  code == "1.A.3.a.ii"
] -> dbf

# category
dbf[, unique(category)]

# type
dbf[, unique(region), by = pol]

dbf[, unique(tech)]


# fuels
fuels <- dbf[, unique(fuel)]
cat(fuels, sep = "\n")

# tech ####
dbf[, unique(tech)]

dbf[unit == "g/LTO"]

dbf[unit == "g/LTO", unique(tech)]

dbf[unit == "g/LTO", unique(pol)]

dbf[
  unit == "g/LTO" &
    tech ==
      "Aircraft types: Airbus A320, Boeing 727, Boeing 737 - 400, Mc Donald Douglas DC9 and MD80; Fuel Consumption 850kg/LTO (Average Fleet)"
]


dbf[
  unit == "g/LTO" &
    tech ==
      "Aircraft types: Airbus A320, Boeing 727, Boeing 737 - 400, Mc Donald Douglas DC9 and MD80; Fuel Consumption 850kg/LTO (Average Fleet)"
] -> db_ef

db_ef

db_ef[, .N, by = pol]

activity <- data.table(
  id = 1,
  lat = -23,
  lon = -46,
  alt = 10,
  code = "1.A.3.a.ii",
  activity = rnorm(n = 12, mean = 500, sd = 100),
  unit = "LTO",
  date = seq.Date(as.Date("2020-01-01"), length.out = 12, by = "month"),
  region = "HERE"
)

rbindlist(lapply(1:nrow(activity), function(i) {
  df <- db_ef
  df$id <- activity$id[i]
  df$lat <- activity$lat[i]
  df$lon <- activity$lon[i]
  df$alt <- activity$alt[i]

  df$activity <- activity$activity[i]
  df$unit_activity <- activity$unit[i]
  df$date_activity <- activity$date[i]
  df$region <- activity$region[i]
  df
})) -> dt

# dt[, emissions := ef * activity]
# # BC is % of PM2.5
# # dt[pol == "PM2.5"]
# # dt[pol == "BC"]
# # dt[pol == "BC", emissions := ef / 100 * dt[pol == "PM2.5"]$emissions]
# # dt[pol == "BC"]
fwrite(
  dt,
  "estimation/1/1.A/1.A.3/emissions/1A3ii_IPCC_domestic_aviation.csv"
)
