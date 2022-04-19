# Description -------------------------------------------------------------

# This R script prepares a map of the air quality sensor locations.

# Code --------------------------------------------------------------------

## load libraries

library(dplyr)
library(leaflet)
library(mapview)

## read data

locations <- readr::read_csv("data/intermediate/maize-mill-locations.csv")

leaflet(locations) %>% 
  setView(lng = 35.03953, 
          lat = -15.77967,
          zoom = 16) %>% 
  #addProviderTiles(providers$Stamen) %>% 
  addTiles() %>% 
  addCircleMarkers(
    lng = ~long, 
    lat = ~lat,
    label = ~name,
    radius = 20,
    stroke = FALSE,
    fillOpacity = 1,
    labelOptions = labelOptions(noHide = T,
                                textsize = "18px",
                                direction = "left",
                                offset = c(-10, 0),
                                style = list(
                                  "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                  "border-color" = "rgba(0,0,0,0.5)"
                                  #"font-style" = "italic"
                                ))) %>% 
  
  mapshot(file = "figs/map-maize-mills.png")

