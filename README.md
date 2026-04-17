# PEGA Emissions Inventory

This repository contains the scripts, data processing logic, and project structure for estimating atmospheric emissions using the `pega` R package.

## Project Structure

The project follows a bottom-up estimation approach and is structured according to IPCC/NFR reporting guidelines:
- `estimation/`: Contains the R scripts for calculating emissions, organized hierarchically by sector (e.g., `1/1.A/1.A.1/scripts/`).
- `post/`: Scripts for post-processing the calculated emissions.
- `scripts/`: General utility scripts used across the project.
- `xx.csv`: A mapping file containing category, fuel, and methodology information.
- `main.R`: The main execution script.

## Goal
The primary objective is to build a systematic framework that applies normalized Emission Factors (from `pega`) to real-world Activity Data to produce a highly granular atmospheric emissions inventory. The core database has been normalized internally to reduce the complexity of unit conversions during the estimation phase.

## For Collaborators
If you are helping with data collection, please read the [Data Collection Guide](data_collection_guide.md) first. It contains important instructions regarding the units we need (mostly Gigajoules, `GJ`) and the exceptions for certain fuels.

## Technologies
Note that in many cases one random echnology is selected to illustrate the use of `pega`, it is up the user to add more technologies