# 🏛️ Project Architecture & Workflow

This document explains the technical structure of the PEGA Emissions Inventory and how the data flows from collection to final emission files.

## 📂 Directory Hierarchy

The project structure is designed to mirror the IPCC/EMEP hierarchical classification.

```text
pega_inventory/
├── main.R                  # Orchestrates the full run
├── estimation/             # Sectoral calculation logic
│   ├── 1_energy/
│   │   ├── 1a_fuel_consumption/
│   │   │   ├── 1a1_electricity_heat/
│   │   │   │   ├── scripts/   # R scripts for each fuel
│   │   │   │   └── emissions/ # Generated CSV outputs
│   │   │   └── ...
│   │   └── 1b_fugitive/
│   ├── 2_industrial/
│   └── ...
├── post/                   # Post-estimation processing
└── docs/                   # Documentation and guides
```

## ⚙️ The Estimation Workflow

Each estimation script (found in `estimation/.../scripts/`) follows a standard template:

1.  **Library Loading**: Loads `data.table` and `pega`.
2.  **Database Access**: Retrieves emission factors using `ef(returnfdb = T)`.
3.  **Filtering**: Selects the specific Tier (Tier 1, 2, or 3) and fuel for the target sector.
4.  **Activity Data Integration**: Maps the collected activity data (Year, Region, Amount) to the emission factor dataframe.
5.  **Calculation**: Computes `emissions = ef * activity`.
6.  **Export**: Saves the resulting data to the corresponding `emissions/` folder.

## 🗺️ Mapping File (`xx.csv`)

The `xx.csv` file acts as the "source of truth" for mapping:
- External data categories to internal `pega` codes.
- Fuel types to their respective normalization factors.
- Methodology selection (EMEP vs IPCC).

## 🔄 Post-Processing

After scripts in `estimation/` are run, the `post/` directory contains scripts to:
- Aggregate emissions across sectors.
- Perform spatial allocation (gridding).
- Apply temporal profiles (hourly/monthly variation).
- Format data for chemical transport models (CTMs) like WRF-Chem or CMAQ.
