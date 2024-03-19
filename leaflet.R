data <- read.csv("data/cleanedData.csv")


library(leaflet)
library(mapview)
library(webshot2)

#generate Ocurrence Map
map <- leaflet() |>
  addProviderTiles("Esri.WorldTopoMap") |>
  addCircleMarkers(data = data,
                   lat = ~decimalLatitude,
                   lng = ~decimalLongitude,
                   radius = 3,
                   color = "purple",
                   fillOpacity = 0.8) |>
  addLegend(position = "topright",
            title = "Species Occurences from GBIF",
            labels = "Habronattus americanus",
            colors = "purple")

# Add base map
# More options here: https://leaflet-extras.github.io/leaflet-providers/preview/
addProviderTiles("Esri.WorldTopoMap") |>
  
#save the map
mapshot2(map, file = "output/leafletTest.png")

