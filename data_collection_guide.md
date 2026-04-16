# Emissions Inventory: Activity Data Collection Guide

## 1. Project Overview & Status
We are building a bottom-up atmospheric emissions inventory. To make calculations simpler and reduce errors, the core emission factor database (the `pega` package's `sysdata.rda`) has already been normalized. Most emission units are now standardized.

**Your Task**: We need to collect **Activity Data** (e.g., how much fuel was consumed) for various sectors so we can multiply it by the normalized emission factors.

## 2. Important Rules for Data Collection
To avoid errors in our calculations, please follow these rules strictly:
- **Pay close attention to units**: Almost all our models expect the data in **Gigajoules (GJ)**. Do not provide data in tonnes, liters, or other units unless explicitly requested below.
- If the original data source uses a different unit (like kilotonnes or millions of cubic meters), you **must** convert it to the requested unit (usually GJ) using standard conversion factors before delivering the data.

## 3. Required Data for Sector 1.A.1 (Energy Industries)

We need the total consumption amounts for the following categories and fuels. Please provide the data in the specified unit.

### Category 1.A.1.a - Public Electricity and Heat Production
**Required Unit:** `GJ` (Gigajoules) for all fuels below:
- Biogas
- Biomass
- Blast Furnace Gas
- Brown Coal
- Cooking Oil and Coal
- Hard Coal
- Heavy Fuel Oil
- Natural Gas
- Oil Gas
- Wood Waste
- Anthracite
- Other Biogas
- Other Bituminous Coal
- Sub-bituminous Coal

**Exception:**
- Landfill Gas: **`m3`** (Cubic meters)

### Category 1.A.1.b - Petroleum Refining
**Required Unit:** `GJ` (Gigajoules) for all fuels below:
- Residual Fuel Oil
- Residual Refinery Oil
- Natural Gas
- Oil Gas

**Exceptions:**
- Refinery Gas: **`crude oil`** (Amount of crude oil processed)
- Coke Coal: **`tonne coke produces`** (Tonnes of coke produced)

### Category 1.A.1.c - Manufacture of Solid Fuels and Other Energy Industries
**Required Unit:**
- Coal (General): `GJ`
- Natural Gas: `GJ` (Note: internal factors may be based on g/GJ of fuel)

**Exception:**
- Coking Coal: **`tonne coke produces`** (Tonnes of coke produced)

## 4. How to Deliver the Data
Please organize the collected data into a clean CSV or spreadsheet. It should have clear columns:
- `Year`
- `Category` (e.g., 1.A.1.a)
- `Fuel` (e.g., Biogas)
- `Amount`
- `Unit` (must match the requirements above)
- `Source` (where you got the data from)

If you have any questions or if a specific fuel's data is only available in a unit you cannot convert to GJ, please ask before making assumptions.
