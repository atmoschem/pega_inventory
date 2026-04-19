# IPCC
# 1: Energy
# 1.A Fuel Combustion Activities
# 1.A.3 - IPCC Transport
# 1.A.3.a - IPCC Civil Aviation\n"
# 1.A.3.a - IPCC Civil Aviation\n1.A.3.a.i - International Aviation (International Bunkers)\n1.A.3.a.ii - Domestic Aviation\n"
# 1.A.3.a - IPCC Civil Aviation\n1.A.3.a.ii - Domestic Aviation\n
# 1.A.3.a.i - IPCC International Aviation (International Bunkers)\n
# 1.A.3.a.ii - IPCC Domestic Aviation\n
# 1.A.3.a.i.(i) - EMEP International aviation (LTO)
# 1.A.3.a.ii.(i) - EMEP "Civil aviation (domestic, LTO)
# 1.A.3.b - Road Transportation\n"
# 1.A.3.b - Road Transportation\n1.A.3.b.ii - Light-duty trucks\n1.A.3.b.iii - Heavy-duty trucks and buses\n"
# 1.A.3.b - Road Transportation\n1.A.3.b.i - Cars\n"
# "Road transport, passenger cars"
# "1.A.3.b.i - Cars\n"
# "1.A.3.b.i - Cars\n
# 1.A.3.b.ii - Light-duty trucks\n"
# "1.A.3.b.i.1 - Passenger cars with 3-way catalysts\n"
# "1.A.3.b.ii - Light-duty trucks\n"
# "1.A.3.b.iii - Heavy-duty trucks and buses\n"
# "1.A.3.b.iv - Motorcycles\n"
# "1.A.3.b.v - Road transport, gasoline evaporation"
# "1.A.3.b.vi - "Road transport, automobile tyre and brake wear"
# "1.A.3.c - "Railways"             "1.A.3.c - Railways\n"
# "1.A.3.d - Water-borne Navigation\n"
# 1.A.3.d.i - International water-borne navigation (International bunkers)\n"
# 1.A.3.d.ii - "National navigation"
# 1.A.3.e.ii - Off-road
# "1.A.4 - Other Sectors\n"
# "1.A.4.a - Commercial/Institutional\n"
# "1.A.4.a.i - Commercial / institutional: stationary
# "1.A.4.a.ii -"Commercial / institutional: mobile"
# "1.A.5.a - "Other, stationary (including military)"
# "1.A.5.b"

# "1.B.1.a - Coal mining and handling\n"
# "1.B.1.b "Fugitive emissions from solid fuels - Solid fuel transformation"

# "1.B.2.a - Oil\n"
# "1.B.2.b - Natural Gas\n"
# 1.B.3 - Other emissions from Energy Production\n"

# "2.A.1 - Cement production\n"
# "2.A.2 - Lime production\n"

library(data.table)
library(pega)

# database
db <- ef(returnfdb = T)

db[,
  grep("2.A.2", code, value = T)
] |>
  unique()

# database final
db[
  code == "2.A.2"
] -> dbf

# category
dbf[, unique(category)]

# type
dbf[, unique(region), by = pol]

db[
  code == "2.A.2",
  unique(tech)
]

db[
  code == "2.A.2" &
    is.na(tech),
][1:5] -> db_ef

View(db_ef)

db_ef[, unique(source)]

db_ef[, unique(tech2)]

db_ef[, .N, by = pol]

activity <- data.table(
  id = 1,
  lat = -23,
  lon = -46,
  alt = 10,
  code = "2.A.2",
  activity = rorm(n = 12, mean = 500, sd = 100),
  unit = "Mg",
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

dt[, emissions := ef * activity]
# BC is % of PM2.5
dt[pol == "PM2.5"]
dt[pol == "BC"]
dt[pol == "BC", emissions := ef / 100 * dt[pol == "PM2.5"]$emissions]
dt[pol == "BC"]
fwrite(
  dt,
  "estimation/2_industrial_processes/2a_mineral/2a2_lime/emissions/2A2.csv"
)
