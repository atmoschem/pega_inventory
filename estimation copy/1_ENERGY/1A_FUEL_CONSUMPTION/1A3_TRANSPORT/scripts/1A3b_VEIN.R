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

library(data.table)
library(pega)

# database
db <- ef(returnfdb = T)

db[,
  grep("1.A.3.b", code, value = T)
] |>
  unique()

# database final
db[
  code == "1.A.3.b"
] -> dbf

# category
dbf[, unique(category)]

# type
dbf[, unique(region), by = pol]

# USE VEIN
