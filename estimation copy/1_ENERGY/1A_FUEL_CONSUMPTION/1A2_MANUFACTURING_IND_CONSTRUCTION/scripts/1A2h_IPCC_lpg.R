# IPCC
# 1: Energy
# 1.A Fuel Combustion Activities
# 1.A.2 - Manufacturing Industries and Construction\n"
# 1.A.2.a - EMEP Iron and steel
# 1.A.2.b - EMEP Non-ferrous metals
# 1.A.2.c - EMEP Chemicals
# 1.A.2.d - EMEP Pulp, paper and print
# 1.A.2.e - EMEP Food processing, beverages and tobacco
# 1.A.2.f - IPCC Non-Metallic Minerals
# 1.A.2.g - IPCC Transport Equipment
# 1.A.2.g.vii - EMEP Mobile combustion in manufacturing industries and construction: Other (Please specify in your IIR)
# 1.A.2.g.viii - EMEP Stationary combustion in manufacturing industries and construction (Please specify in your IIR)
# 1.A.2.h - IPCC Machinery

library(data.table)
library(pega)

# database
db <- ef(returnfdb = T)

db[,
  grep("1.A.2", code, value = T)
] |>
  unique()

# database final
db[
  code == "1.A.2.h"
] -> dbf

# category
dbf[, unique(category)]

# type
dbf[, unique(region), by = pol]

# [1] "1996 IPCC default" "2006 IPCC default"

db[
  code == "1.A.2.h",
  unique(tech2)
]

# [1] "Load during measurement about 80%, Flue gas(dry) : O2 19.85%, CO2 0.97%, CO 191.3 ppm"
# [2] "Load during measurement about 60% -100%, Flue gas(dry) : O2 9.62-19.28%, CO2 0.47-7.15%, CO 134.5-3436ppm"
# [3] "Load during measurement about 60% -100%, Flue gas(dry) : O2 8.15-17.83%, CO2 1.55-6.71%,CO 82.05-150.7ppm"
# [4] "Load during measurement about 100%, Flue gas(dry) : O2 12.6%, CO2 5.04% , CO 137.6ppm"
# [5] "Load during measurement about 90%, Flue gas(dry) : O2 14.47%, CO2 4.87%, CO 597.2 ppm"
# [6] "Load during measurement about 60% -100%, Flue gas(dry) : O2 8.2-19.3%, CO2 0.84-8.69%, CO 28.2-241.9 ppm"
# [7] "Load during measurement about 80%, Flue gas(dry) : O2 5.85%, CO2 11.02%, CO 199.7 ppm"
# [8] "Load during measurement about 60% -100%, Flue gas(dry) : O2 5.54-16.13%, CO2 3.11-9.54%, CO 0-1679ppm"
# [9] "Load during measurement about 60% -90%, Flue gas(dry) : O2 4.41-10.19%, CO2 8.07-12.62%"

db[
  code == "1.A.2.h" &
    tech == "drying furnace in the type of conveyor belt"
] -> dbf

# fuels
fuels <- dbf[, unique(fuel)]
cat(fuels, sep = "\n")

# tech ####
dbf[, unique(tech)]

dbf[
  fuel == "Liquefied Petroleum Gases",
  unique(tech)
]

dbf[
  fuel == "Liquefied Petroleum Gases"
] -> db_ef

db_ef

db_ef[, unique(unit)]

db_ef[, .N, by = pol]

activity <- data.table(
  id = 1,
  lat = -23,
  lon = -46,
  alt = 10,
  code = "1.A.2.h",
  activity = rnorm(n = 12, mean = 500, sd = 100),
  unit = "GJ",
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
# dt[pol == "BC", emissions := ef / 100 * dt[pol == "PM2.5"]$emissions]
# dt[pol == "BC"]
fwrite(
  dt,
  "estimation/1/1.A/1.A.2/emissions/1A2h_IPCC_lpg.csv"
)

# Crude Oil
# Orimulsion
# Natural Gas
# Motor Gasoline
# Aviation Gasoline
# Jet Gasoline
# Jet Kerosene
# Other Kerosene
# Shale Oil
# Oil Gas
# Diesel Oil
# Residual Fuel Oil
# Liquefied Petroleum Gases
# Ethane
# Naphtha
# Bitumen
# Lubricants
# Petroleum Coke
# Refinery Feedstocks
# Refinery Gas
# Waxes
# White Spirit & SBP
# Other Petroleum Products
# Anthracite
# Coking Coal
# Other Bituminous Coal
# Sub-Bituminous Coal
# Lignite
# Oil Shale and Tar Sands
# Brown Coal Briquettes
# Patent Fuel
# Coke Oven Coke and Lignite Coke
# Gas Coke
# Coal Tar
# Gas Works Gas
# Coke Oven Gas
# Blast Furnace Gas
# Oxygen Steel Furnace Gas
# Municipal Wastes (non-biomass fraction)
# Industrial Wastes
# Waste Oils
# Peat
# Wood/Wood Waste
# Sulphite Lyes (Black Liquor)
# Other Primary Solid Biomass
# Charcoal
# Biogasoline
# Biodiesels
# Other Liquid Biofuels
# Landfill Gas
# Sludge Gas
# Other Biogas
# Municipal Wastes (biomass fraction)

# EMEP
# Biomass
# 'Other' Liquid Fuels
# Solid Fuels
# Gaseous Fuels

# IPCC 1A2f
# Industrial Wastes
# Natural Gas
# Other Bituminous Coal
# Anthracite
# Residual Fuel Oil
# Liquefied Petroleum Gases
