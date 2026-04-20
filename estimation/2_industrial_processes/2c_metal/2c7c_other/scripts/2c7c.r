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
# "2.A.3 - Glass Production\n"
# "2.A.4 - Other Process Uses of Carbonates\n"
# "2.A.4.a - Ceramics\n"
# "2.A.4.b - Other Uses of Soda Ash\n"
# "2.A.4.c - Non Metallurgical Magnesia Production\n"
# "2.B.1 - Ammonia Production\n"
# "2.B.2 - Nitric Acid Production\n"
# "2.B.3 - Adipic Acid Production\n"
# "2.B.4 - Caprolactam, Glyoxal and Glyoxylic Acid Production\n"
# "2.B.5 - Carbide Production\n"
# "2.B.6 - Titanium Dioxide Production\n"
# "2.B.7 - Soda Ash Production\n"
# "2.B.8.a - Methanol\n"
# "2.B.8.b - Ethylene\n"
# "2.B.8.c - Ethylene Dichloride and Vinyl Chloride Monomer\n"
# "2.B.8.d - Ethylene Oxide\n"
# "2.B.8.e - Acrylonitrile\n"
# "2.B.8.f - Carbon Black\n"
# "2.B.9.a - By-product emissions hfc\n"
# "2.B.9.b - Fugitive Emissions hfc\n"
# "2.B.10.a - Chemical industry: Other"

# "2.C.1 - Iron and Steel Production\n"
# "2.C.2 - Ferroalloys Production\n"
# "2.C.3 - Aluminium production\n"
# "2.C.4 - Magnesium production\n"
# "2.C.5 - Lead Production\n"
# "2.C.6 - Zinc Production\n"
# "2.C.7.a - Copper production"
# "2.C.7.b - Nickel production"
# "2.C.7.c - "Other metal production"

library(data.table)
library(pega)

# database
db <- ef(returnfdb = T)

db[,
  grep("2.C", code, value = T)
] |>
  unique()

# database final
db[
  code == "2.C.7.c"
] -> dbf

unique(dbf$pol)

# category
dbf[, unique(category)]

# type
dbf[, unique(region), by = pol]

db[
  code == "2.C.7.c",
  unique(tech),
  by = source
][source == "EMEP"]


db[
  code == "2.C.7.c",
  unique(tech),
  by = source
][source == "IPCC"]

db[
  code == "2.C.7.c" &
    is.na(tech)
] -> db_ef

db_ef[, unique(source)]

db_ef[, unique(tech2)]

db_ef[, .N, by = .(pol, source)]

activity <- data.table(
  id = 1,
  lat = -23,
  lon = -46,
  alt = 10,
  code = "2.C.7.c",
  activity = rnorm(n = 12, mean = 500, sd = 100),
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
# dt[pol == "PM2.5"]
# dt[pol == "BC"]
# dt[pol == "BC", emissions := ef  * dt[pol == "PM2.5"]$emissions]
# dt[pol == "BC"]

fwrite(
  dt,
  "estimation/2_industrial_processes/2c_iron_steel/2c7c/emissions/2c7c.csv"
)
