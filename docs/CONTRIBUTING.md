# 🤝 Contributing to PEGA Inventory

We welcome contributions! Whether you are adding a new sector, updating emission factors, or improving the processing scripts, please follow these guidelines.

## ➕ Adding a New Sector

To add a new emission sector:

1.  **Navigate** to the appropriate IPCC directory in `estimation/`.
2.  **Create** a subfolder structure if it doesn't exist: `sector_name/scripts/` and `sector_name/emissions/`.
3.  **Create** a new R script following the naming convention: `[code]_[methodology]_[fuel].r` (e.g., `1a1a_emep_biogas.r`).
4.  **Use the Template**:
    ```r
    library(pega)
    library(data.table)

    # 1. Get Factors
    db <- ef(returnfdb = T)[code == "YOUR_CODE" & fuel == "YOUR_FUEL"]

    # 2. Add Activity Data
    # activity <- read.csv("path/to/data.csv")

    # 3. Calculate & Save
    # ...
    ```

## 🛠️ Code Style

- Use `data.table` for all data manipulations to ensure performance with large datasets.
- Ensure all file paths are relative to the project root.
- Document any specific assumptions or unit conversions made within the script comments.

## 🧪 Testing

Before submitting a new script:
1. Run the script and check the `emissions/` output.
2. Verify that pollutants (NOx, SOx, PM, etc.) are within expected orders of magnitude.
3. Ensure the `unit` columns are clearly defined.

## 📬 Pull Requests

- Keep PRs focused on a single sector or feature.
- Update the `PROJECT_STATUS.md` (if available) to reflect your changes.
