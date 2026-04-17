# 🧪 Methodology

The PEGA Emissions Inventory combines two major international guidelines with a custom normalization layer provided by the `pega` R package.

## 📚 Reference Guidelines

1.  **EMEP/EEA Air Pollutant Emission Inventory Guidebook**: Used primarily for non-greenhouse gas pollutants (NOx, SOx, PM, VOCs, NH3, CO).
2.  **IPCC Guidelines for National Greenhouse Gas Inventories**: Used for GHGs (CO2, CH4, N2O).

## 🧮 Calculation Tiers

The project supports three tiers of estimation:

- **Tier 1**: Simple method using default emission factors and national activity statistics.
- **Tier 2**: Uses technology-specific emission factors (e.g., specific to the type of boiler or abatement technology).
- **Tier 3**: Detailed models based on plant-level data, continuous monitoring, or complex process simulations.

## 📏 Unit Normalization

One of the most critical aspects of this project is the **pre-normalization** of emission factors.

In many inventories, units vary wildly (g/kg, kg/tonne, lb/MMBtu). In this project:
- All energy-related factors are normalized to **g/GJ** (grams per Gigajoule).
- Activity data must be converted to **GJ** before multiplication.
- Resulting emissions are usually output in **g** or **kg**, which are then aggregated to **Mg** (Megagrams/Tonnes).

## 🧬 The `pega` Package Role

The `pega` package provides:
- A curated database of EMEP/IPCC factors.
- Functions to retrieve these factors based on standardized codes.
- Utility functions for unit conversion and spatial mapping.

### Example Retrieval

```r
library(pega)
# Retrieve Tier 1 factors for Natural Gas in the Energy sector
factors <- ef(returnfdb = TRUE)[code == "1.A.1.a" & fuel == "Natural Gas" & type == "Tier 1 Emission Factor"]
```

## ❄️ Chemical Speciation

For post-processing, VOC and PM emissions are further speciated into chemical mechanisms (e.g., SAPRC-99, MOZART, CB6) to be used in atmospheric models. This logic is handled in the `post/` directory.
