# 📑 Sector 1.B: Fugitive Emissions from Fuels - Expected Units

This document lists the activities within Sector 1.B and the expected units for the activity data. This ensures compatibility with the normalized emission factors in the `pega` package.

---

## 🛢️ 1.B.1: Solid Fuels

| Category | Description | Expected Unit | Notes |
| :--- | :--- | :--- | :--- |
| **1.B.1.a** | Coal Mining and Handling | **Tonnes of Coal** | Includes underground and surface mining. |
| **1.B.1.b** | Fuel Transformation | **Tonnes of Product** | e.g., Coking coal. |

---

## ⛽ 1.B.2: Oil and Natural Gas

Fugitive emissions from oil and gas are often based on the energy content of the fuel produced or throughput.

| Category | Description | Expected Unit | Notes |
| :--- | :--- | :--- | :--- |
| **1.B.2.a** | Oil | **PJ** or **m³** | Check script for specific IPCC/EMEP mapping. |
| **1.B.2.b** | Natural Gas | **PJ** or **m³** | Often involves venting and flaring. |
| **1.B.2.c** | Venting and Flaring | **PJ** | Combined emissions from these activities. |

---

## 🌋 1.B.3: Other Emissions from Energy Production

| Category | Description | Expected Unit |
| :--- | :--- | :--- |
| **1.B.3** | Geothermal, etc. | **PJ** |

---

## 🛠️ Summary of Unit Exceptions

1.  **Mining (1.B.1)**: Always use mass (**Tonnes**) of the fuel mined or handled.
2.  **Oil & Gas (1.B.2)**: While **PJ** (Petajoules) is preferred for high-level energy balances, some Tier 2/3 factors may require **m³** of gas or **Mg** of oil. Always check the `pega` database units before collection.
