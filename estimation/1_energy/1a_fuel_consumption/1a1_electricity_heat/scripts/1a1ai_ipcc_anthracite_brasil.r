# IPCC
# 1: Energy
# 1.A Fuel Combustion Activities
# 1.A.1.a Main Activities Electricity and Heat Production
# category: 1.A.1.a.i Electricity Generation

library(data.table)
library(pega)

# database
db <- ef(returnfdb = T)

# database final
db[,
  grep("1.A.1.a", code, value = T),
] |>
  unique()

db[
  code == "1.A.1.a.i"
] -> dbf

# category
dbf[, unique(category)]

# fuels
fuels <- dbf[, unique(fuel)]
cat(fuels, sep = "\n")

dbf[fuel == "Anthracite"]

# Anthracite ####
dbf[fuel == "Anthracite", unique(tech)]

dbf[
  fuel == "Anthracite" &
    tech %in%
      c(
        "Power Boiler with circulating fluidized bed in the capacity of 200MW",
        "Combustion at thermal power plants"
      )
] -> db_ef

db_ef
db_ef[, .N, by = pol]

x <- fread("../pega/data/tpp_coal_2020.txt")

activity <- data.table(
  id = x$ID,
  lat = x$latitude,
  lon = x$longitude,
  alt = 20,
  code = "1.A.1.a",
  activity = x$Fuel_consumed_plant_GJ, #GJ
  unit = "GJ",
  date = as.Date(ISOdate(year = x$year, 1, 1, 0,0,0)),
  region = "UF"
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
# dt[pol == "BC", emissions := ef / 100 * dt[pol == "PM2.5"]$emissions]
# dt[pol == "BC"]
fwrite(dt, "estimation/1_energy/1a_fuel_consumption/1a1_electricity_heat/emissions/IPCC_1A1a_hard_coal.csv.gz")
dt[, sum(emissions), by = pol]

#EMEP
# Natural Gas ####
# Heavy Fuel Oil ####
# Brown Coal ####
# Hard Coal ####
# Biomass ####
# Blast furnace/Basic O2 furnace gas ####
# Biogas ####
# Coking Coal, Steam Coal & Sub-Bituminous Coal ####
# Oil Gas ####
# Wood and wood waste (clean wood waste) ####
# Brown Coal/Lignite ####
# Residual Oil ####
# Gaseous Fuels ####

# IPCC
# Other Bituminous Coal
# Other Biogas
# Landfill Gas
# Diesel Oil
# Natural Gas
# Anthracite
# Residual Fuel Oil
