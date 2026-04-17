# 📋 Activity Data Collection Guide

This guide outlines the requirements and procedures for collecting Activity Data (AD) for the PEGA Emissions Inventory.

## 1. Project Overview
We are building a **bottom-up atmospheric emissions inventory**. The core emission factor database (the `pega` package's `sysdata.rda`) has been normalized to reduce unit conversion errors during the estimation phase.

**Your Role**: Collect fuel consumption and activity statistics for specific sectors and ensure they match the required units and formats.

---

## 2. Core Principles
To maintain data integrity, follow these rules strictly:

1.  **Unit Standardization**: Most models expect data in **Gigajoules (GJ)**.
2.  **Explicit Conversion**: If your source is in tonnes, liters, or m³, you **must** convert it to GJ using standard net calorific values (NCV) before entry.
3.  **Source Attribution**: Always document the specific source (URL, Report Name, Year) for every data point.
4.  **No Assumptions**: If you encounter a fuel not listed or a unit you cannot convert, ask the project lead.

---

## 3. Sector-Specific Requirements

### ⚡ Category 1.A.1.a - Public Electricity & Heat Production
**Required Unit:** `GJ` (Net Calorific Value)

| Fuel | Required Unit | Notes |
| :--- | :--- | :--- |
| Natural Gas | GJ | |
| Hard Coal | GJ | |
| Brown Coal | GJ | |
| Biogas | GJ | |
| Biomass / Wood | GJ | |
| Heavy Fuel Oil | GJ | |
| **Landfill Gas** | **m³** | *Exception to the GJ rule* |

### ⛽ Category 1.A.1.b - Petroleum Refining
**Required Unit:** `GJ` (Gigajoules)

- Residual Fuel Oil
- Natural Gas
- Oil Gas
- **Refinery Gas**: Exception - measured in `amount of crude oil processed`.
- **Coke Coal**: Exception - measured in `tonnes of coke produced`.

---

## 4. Data Delivery Format
Please deliver data in a structured CSV format with the following columns:

| Column | Description | Example |
| :--- | :--- | :--- |
| `Year` | The calendar year of the data | `2023` |
| `Category` | The IPCC/NFR code | `1.A.1.a` |
| `Fuel` | The fuel name as defined in `pega` | `Natural Gas` |
| `Amount` | The numerical value | `1540.2` |
| `Unit` | The unit used (must be GJ unless exception) | `GJ` |
| `Source` | Link or name of the source document | `IEA 2023 Report` |

---

## 🛠️ Helpful Conversions
*Placeholder for common conversion factors (e.g., Natural Gas GJ/m³, Coal GJ/tonne).*

> [!TIP]
> Use the `pega` package's internal constants for conversion when possible to maintain consistency with the emission factors.
