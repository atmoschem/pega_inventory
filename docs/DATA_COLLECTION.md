# 📋 Activity Data Collection Guide

This guide outlines the requirements and procedures for collecting Activity Data (AD) for the PEGA Emissions Inventory.

## 1. Project Overview
We are building a **bottom-up atmospheric emissions inventory**. The core emission factor database (the `pega` package's `sysdata.rda`) has been normalized to reduce unit conversion errors during the estimation phase.

**Your Role**: Collect fuel consumption and activity statistics for specific sectors and ensure they match the required units and formats.

---

## 2. Core Principles
To maintain data integrity, follow these rules strictly:

1.  **Unit Standardization**: 
    - **Sector 1.A (Fuel Combustion)**: Most models expect data in **Gigajoules (GJ)**.
    - **Sector 2 (Industrial Processes)**: Most models expect data in **Megagrams (Mg)** (Metric Tonnes).
2.  **Explicit Conversion**: If your source is in volume or other units, you **must** convert it to the required standard (GJ or Mg) before entry.
3.  **Source Attribution**: Always document the specific source (URL, Report Name, Year) for every data point.
4.  **No Assumptions**: If you encounter a fuel/process not listed or a unit you cannot convert, ask the project lead.

---

## 3. Sector-Specific Requirements

For detailed lists of sectors and their expected units, refer to the following guides:

- 📊 [**Sector 1.A: Fuel Combustion**](SECTOR_1A_ACTIVITIES.md)
- 💨 [**Sector 1.B: Fugitive Emissions**](SECTOR_1B_ACTIVITIES.md)
- 🏭 [**Sector 2: Industrial Processes**](SECTOR_2_ACTIVITIES.md)

---

## 4. Data Delivery Format
Please deliver data in a structured CSV format with the following columns:

| Column | Description | Example |
| :--- | :--- | :--- |
| `Year` | The calendar year of the data | `2023` |
| `Category` | The IPCC/NFR code | `1.A.1.a` |
| `Fuel_or_Product` | The fuel or industrial product name | `Natural Gas` or `Cement` |
| `Amount` | The numerical value | `1540.2` |
| `Unit` | The standard unit (GJ, Mg, etc.) | `GJ` |
| `Source` | Link or name of the source document | `IEA 2023 Report` |

---

## 🛠️ Helpful Conversions
*Placeholder for common conversion factors (e.g., Natural Gas GJ/m³, Coal GJ/tonne).*

> [!TIP]
> Use the `pega` package's internal constants for conversion when possible to maintain consistency with the emission factors.
