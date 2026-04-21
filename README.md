# 🌍 PEGA Emissions Inventory

[![Status](https://img.shields.io/badge/Status-Development-orange.svg)](#)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](#)

> A systematic framework for high-resolution atmospheric emissions estimation using the `pega` R package.

---

## 🚀 Overview

The **PEGA Emissions Inventory** project is designed to produce granular, bottom-up atmospheric emissions data. By combining normalized emission factors from the `pega` package with real-world activity data, we generate comprehensive datasets following IPCC and EMEP/EEA guidelines.

Our core methodology focuses on **unit normalization** and **sector-specific modeling** to ensure consistency across the entire inventory.

---

## 📂 Project Structure

The repository is organized following the IPCC/NFR reporting hierarchy:

| Directory | Description |
| :--- | :--- |
| [`estimation/`](#) | 🧬 Core logic. Hierarchical R scripts for emission calculations. |
| [`post/`](#) | 🛠️ Post-processing scripts for spatial and temporal allocation. |
| [`scripts/`](#) | 🔧 General utility functions and helper scripts. |
| [`docs/`](docs/) | 📚 Comprehensive project documentation. |
| [`xx.csv`](xx.csv) | 🗺️ Master mapping file for categories, fuels, and methodologies. |
| [`main.R`](main.R) | 🏁 Main execution entry point. |

---

## 🛠️ Getting Started

### Prerequisites

- **R** (>= 4.0.0)
- **R Packages**: `data.table`, `pega`, `ggplot2`, `sf`
- **Data**: Activity data for specific sectors (see [Data Collection Guide](docs/DATA_COLLECTION.md)).

### Installation

```r
# Install development version of pega if not already present
# devtools::install_github("atmoschem/pega")

# Clone the repository
# git clone https://github.com/youruser/pega_inventory.git
```

---

## 📖 Documentation Index

| Guide | Description |
| :--- | :--- |
| 📋 [**Data Collection Guide**](docs/DATA_COLLECTION.md) | Essential instructions for collaborators on gathering activity data. |
| 📊 [**Sector 1.A: Fuel Combustion**](docs/SECTOR_1A_ACTIVITIES.md) | Expected units for all Fuel Combustion activities. |
| 💨 [**Sector 1.B: Fugitive Emissions**](docs/SECTOR_1B_ACTIVITIES.md) | Expected units for Fugitive Emissions (Oil, Gas, Coal). |
| 🏭 [**Sector 2: Industrial Processes**](docs/SECTOR_2_ACTIVITIES.md) | Expected units for Industrial Processes (IPPU). |
| 🏛️ [**Architecture & Workflow**](docs/ARCHITECTURE.md) | Detailed breakdown of the project structure and processing pipeline. |
| 🧪 [**Methodology**](docs/METHODOLOGY.md) | Deep dive into EMEP/IPCC tiers and how `pega` handles calculations. |
| 🤝 [**Contributing**](docs/CONTRIBUTING.md) | Guidelines for adding new sectors, fuels, or features. |

---

## 👥 For Collaborators

If you are a student or postdoc working on data collection, please prioritize the **[Data Collection Guide](docs/DATA_COLLECTION.md)**. 

**Key Unit Rules**: 
- **Sector 1.A (Combustion)**: All data must be normalized to **Gigajoules (GJ)**.
- **Sector 1.B (Fugitive)**: Varies by sub-sector (often **PJ** or **m³**).
- **Sector 2 (IPPU)**: All data must be normalized to **Megagrams (Mg)** (Metric Tonnes).

See the sector-specific instructions for detailed requirements.

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Developed with ❤️ by the Atmospheric Chemistry & Modeling Group
</p>