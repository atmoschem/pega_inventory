# 📑 Sector 1.A: Fuel Combustion Activities - Expected Units

This document lists the activities within Sector 1.A and the expected units for the activity data. This ensures compatibility with the normalized emission factors in the `pega` package.

> [!NOTE]
> **Technology Selection**: In several sectors, multiple technologies or abatement methods exist (e.g., different boiler types). For this initial implementation, a representative technology has been selected in the scripts. This guide provides the general unit requirements for those selections.

---

## ⚡ 1.A.1: Energy Industries

| Category | Description | Expected Unit | Exceptions |
| :--- | :--- | :--- | :--- |
| **1.A.1.a** | Public Electricity and Heat Production | **GJ** | Landfill Gas: **m³** |
| **1.A.1.b** | Petroleum Refining | **GJ** | Refinery Gas: **Crude processed**; Coke Coal: **Tonnes produced** |
| **1.A.1.c** | Manufacture of Solid Fuels | **GJ** | Coking Coal: **Tonnes produced** |

---

## 🏭 1.A.2: Manufacturing Industries & Construction

For all manufacturing sub-sectors (1.A.2.a through 1.A.2.g), the standard unit for fuel combustion is **GJ**.

| Sub-sector | Description | Expected Unit |
| :--- | :--- | :--- |
| **1.A.2.a** | Iron and Steel | **GJ** |
| **1.A.2.b** | Non-Ferrous Metals | **GJ** |
| **1.A.2.c** | Chemicals | **GJ** |
| **1.A.2.d** | Pulp, Paper and Print | **GJ** |
| **1.A.2.e** | Food Processing, Beverages and Tobacco | **GJ** |
| **1.A.2.f** | Non-Metallic Minerals | **GJ** |
| **1.A.2.g** | Other Manufacturing | **GJ** |

---

## 🚲 1.A.3: Transport

Transport activities often involve more complex modeling (e.g., using the `vein` package).

| Category | Description | Expected Unit | Notes |
| :--- | :--- | :--- | :--- |
| **1.A.3.a** | Civil Aviation | **GJ** | Based on fuel consumption. |
| **1.A.3.b** | Road Transportation | **VKT** / **Fuel** | Tier 3 often requires Vehicle Kilometers Traveled (VKT) + Fleet Specs. |
| **1.A.3.c** | Railways | **GJ** | Based on diesel/coal consumption. |
| **1.A.3.d** | Water-borne Navigation | **GJ** | Based on bunker fuel consumption. |
| **1.A.3.e** | Other (Off-road, etc.) | **GJ** | |

---

## 🏠 1.A.4: Other Sectors

| Category | Description | Expected Unit |
| :--- | :--- | :--- |
| **1.A.4.a** | Commercial / Institutional | **GJ** |
| **1.A.4.b** | Residential | **GJ** |
| **1.A.4.c** | Agriculture / Forestry / Fishing | **GJ** |

---

## 🎖️ 1.A.5: Non-Specified (Military)

| Category | Description | Expected Unit |
| :--- | :--- | :--- |
| **1.A.5.a** | Stationary (Military) | **GJ** |
| **1.A.5.b** | Mobile (Military) | **GJ** |

---

## 🛠️ Summary of Unit Exceptions

While **GJ** is our primary unit for normalization, always verify if your specific activity falls under these exceptions:

1.  **Transport (1.A.3.b)**: May require Vehicle Kilometers (VKT) and detailed fleet composition if using the `vein` Tier 3 approach.
2.  **Landfill Gas (1.A.1.a)**: Typically measured in volume (**m³**).
3.  **Industrial Outputs (1.A.1.b/c)**: Some factors are based on **tonnes of product** (e.g., Coke) rather than fuel energy.
