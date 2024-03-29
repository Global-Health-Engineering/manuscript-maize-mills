# description -------------------------------------------------------------

# A script to read a KML file and extract the long and lat coordinates for
# further processing

# libraries ---------------------------------------------------------------

library(dplyr)
library(tidyr)
library(sf)
library(purrr)
library(readr)

# read data ---------------------------------------------------------------

locations <- read_sf("data/raw/maize-mill-locations/Ndirand-Maize-Mill.kml")

locations_df <- locations %>% 
  mutate(long = unlist(map(locations$geometry, 1)),
         lat = unlist(map(locations$geometry, 2))) %>% 
  st_drop_geometry() %>% 
  select(-Description) %>% 
  separate(col = Name, into = c("name", "delete")) %>% 
  select(-delete) %>% 
  mutate(name = case_when(
    name == "Ambewe" ~ "Namacha",
    TRUE ~ name
  ))

write_csv(locations_df, file = "data/intermediate/maize-mill-locations.csv")
