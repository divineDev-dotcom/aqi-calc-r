# Install required package if not installed
if (!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)

# Function to calculate AQI for PM2.5, PM10, O₃, NO₂, and SO₂
calculate_aqi <- function(concentration, pollutant) {
  if (pollutant == "PM2.5") {
    if (concentration <= 12) return(50 * concentration / 12) # Good
    if (concentration <= 35.4) return(100 * (concentration - 12.1) / (35.4 - 12.1) + 50) # Moderate
    if (concentration <= 55.4) return(150 * (concentration - 35.5) / (55.4 - 35.5) + 100) # Unhealthy for sensitive groups
    if (concentration <= 150.4) return(200 * (concentration - 55.5) / (150.4 - 55.5) + 150) # Unhealthy
    if (concentration <= 250.4) return(300 * (concentration - 150.5) / (250.4 - 150.5) + 200) # Very Unhealthy
    if (concentration > 250.4) return(400 * (concentration - 250.5) / (350.4 - 250.5) + 300) # Hazardous
  }
  if (pollutant == "PM10") {
    if (concentration <= 54) return(50 * concentration / 54) # Good
    if (concentration <= 154) return(100 * (concentration - 55) / (154 - 55) + 50) # Moderate
    if (concentration <= 254) return(150 * (concentration - 155) / (254 - 155) + 100) # Unhealthy for sensitive groups
    if (concentration <= 354) return(200 * (concentration - 255) / (354 - 255) + 150) # Unhealthy
    if (concentration <= 424) return(300 * (concentration - 355) / (424 - 355) + 200) # Very Unhealthy
    if (concentration > 424) return(400 * (concentration - 425) / (504 - 425) + 300) # Hazardous
  }
  if (pollutant == "O₃") {
    if (concentration <= 0.054) return(50 * concentration / 0.054) # Good
    if (concentration <= 0.070) return(100 * (concentration - 0.055) / (0.070 - 0.055) + 50) # Moderate
    if (concentration <= 0.085) return(150 * (concentration - 0.071) / (0.085 - 0.071) + 100) # Unhealthy for sensitive groups
    if (concentration <= 0.105) return(200 * (concentration - 0.086) / (0.105 - 0.086) + 150) # Unhealthy
    if (concentration <= 0.200) return(300 * (concentration - 0.106) / (0.200 - 0.106) + 200) # Very Unhealthy
    if (concentration > 0.200) return(400 * (concentration - 0.201) / (0.300 - 0.201) + 300) # Hazardous
  }
  if (pollutant == "NO₂") {
    if (concentration <= 0.053) return(50 * concentration / 0.053) # Good
    if (concentration <= 0.100) return(100 * (concentration - 0.054) / (0.100 - 0.054) + 50) # Moderate
    if (concentration <= 0.360) return(150 * (concentration - 0.101) / (0.360 - 0.101) + 100) # Unhealthy for sensitive groups
    if (concentration <= 0.649) return(200 * (concentration - 0.361) / (0.649 - 0.361) + 150) # Unhealthy
    if (concentration <= 1.249) return(300 * (concentration - 0.650) / (1.249 - 0.650) + 200) # Very Unhealthy
    if (concentration > 1.249) return(400 * (concentration - 1.250) / (1.649 - 1.250) + 300) # Hazardous
  }
  if (pollutant == "SO₂") {
    if (concentration <= 0.035) return(50 * concentration / 0.035) # Good
    if (concentration <= 0.075) return(100 * (concentration - 0.036) / (0.075 - 0.036) + 50) # Moderate
    if (concentration <= 0.185) return(150 * (concentration - 0.076) / (0.185 - 0.076) + 100) # Unhealthy for sensitive groups
    if (concentration <= 0.304) return(200 * (concentration - 0.186) / (0.304 - 0.186) + 150) # Unhealthy
    if (concentration <= 0.604) return(300 * (concentration - 0.305) / (0.604 - 0.305) + 200) # Very Unhealthy
    if (concentration > 0.604) return(400 * (concentration - 0.605) / (0.804 - 0.605) + 300) # Hazardous
  }
  return(NA) # Return NA if pollutant is unknown
}

# Input pollutant concentrations
pm25 <- as.numeric(readline(prompt = "Enter PM2.5 concentration (µg/m³): "))
pm10 <- as.numeric(readline(prompt = "Enter PM10 concentration (µg/m³): "))
o3 <- as.numeric(readline(prompt = "Enter Ozone (O₃) concentration (ppm): "))
no2 <- as.numeric(readline(prompt = "Enter Nitrogen Dioxide (NO₂) concentration (ppm): "))
so2 <- as.numeric(readline(prompt = "Enter Sulfur Dioxide (SO₂) concentration (ppm): "))

# Calculate AQI for all pollutants
aqi_pm25 <- calculate_aqi(pm25, "PM2.5")
aqi_pm10 <- calculate_aqi(pm10, "PM10")
aqi_o3 <- calculate_aqi(o3, "O₃")
aqi_no2 <- calculate_aqi(no2, "NO₂")
aqi_so2 <- calculate_aqi(so2, "SO₂")

# Display calculated AQI values
cat("AQI for PM2.5: ", aqi_pm25, "\n")
cat("AQI for PM10: ", aqi_pm10, "\n")
cat("AQI for Ozone (O₃): ", aqi_o3, "\n")
cat("AQI for Nitrogen Dioxide (NO₂): ", aqi_no2, "\n")
cat("AQI for Sulfur Dioxide (SO₂): ", aqi_so2, "\n")

# Prepare data for visualization
df <- data.frame(
  Pollutant = c("PM2.5", "PM10", "O₃", "NO₂", "SO₂"),
  AQI = c(aqi_pm25, aqi_pm10, aqi_o3, aqi_no2, aqi_so2)
)

# Visualize AQI using ggplot2
ggplot(df, aes(x = Pollutant, y = AQI)) +
  geom_bar(stat="identity", fill="skyblue") +
  theme_minimal() +
  labs(title="Air Quality Index (AQI)", y="AQI Level")
