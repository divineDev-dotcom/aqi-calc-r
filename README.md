# Air Quality Index (AQI) Calculator

This R script calculates the Air Quality Index (AQI) for several key pollutants: PM2.5, PM10, Ozone (O₃), Nitrogen Dioxide (NO₂), and Sulfur Dioxide (SO₂). It also visualizes the AQI levels using a bar plot with the ggplot2 library.

## Features
- AQI Calculation: Uses standard AQI breakpoints for each pollutant to calculate the AQI based on user-provided concentration levels.
- User Input: Prompts the user to input concentrations for PM2.5, PM10, O₃, NO₂, and SO₂.
- Visualization: Displays a bar chart visualizing the AQI for each pollutant using ggplot2.
## Requirements
The script requires the ggplot2 package for data visualization. It will automatically install the package if it's not already installed.
## How to Use
1. Run the script in an R environment.
2. Input the pollutant concentration levels when prompted:
- PM2.5 (in µg/m³)
- PM10 (in µg/m³)
- O₃, NO₂, and SO₂ (in ppm)
3. The AQI for each pollutant will be calculated and displayed.
4. A bar plot showing the AQI levels of the pollutants will be generated.
## Installation
If ggplot2 is not installed, the script will install it automatically. To manually install ggplot2, run the following command:
``` r
install.packages("ggplot2")
```
## AQI Breakpoints
The AQI is calculated using pollutant-specific breakpoints. For each pollutant:
- PM2.5 & PM10: Concentration is measured in µg/m³.
- O₃, NO₂, SO₂: Concentration is measured in parts per million (ppm).
### The AQI ranges are classified as:
- Good (0–50)
- Moderate (51–100)
- Unhealthy for Sensitive Groups (101–150)
- Unhealthy (151–200)
- Very Unhealthy (201–300)
- Hazardous (301 and above)
## Example Input
``` r
Enter PM2.5 concentration (µg/m³): 30
Enter PM10 concentration (µg/m³): 80
Enter Ozone (O₃) concentration (ppm): 0.06
Enter Nitrogen Dioxide (NO₂) concentration (ppm): 0.05
Enter Sulfur Dioxide (SO₂) concentration (ppm): 0.04
```
The AQI values for each pollutant will be displayed in the console, followed by a bar plot visualizing the AQI.