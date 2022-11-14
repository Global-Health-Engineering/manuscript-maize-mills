# Description -------------------------------------------------------------

# Script to import and clean raw data for Maize Mills manuscript
# Raw data was shared via Google Drive and downloaded as ZIP file to the repo
# https://drive.google.com/drive/folders/1jv1DtkxJOx8GNNSHmsCnuJ7Ezl0u7ktp

# Author: Lars Schöbitz
# Date: 2022-11-14

# Code --------------------------------------------------------------------

library(dplyr)
library(readxl)
library(ggplot2)
library(tidyr)
library(readr)
library(fs)
library(stringr)
library(here)
library(purrr)

# import data -------------------------------------------------------------

unzip(zipfile = here::here("data/raw/kajombo Maize Mill-20221114T143339Z-001.zip"),
      exdir = here::here("data/raw/"))

if (dir_exists("data/raw/combined/") == FALSE) {
  
  fs::dir_create("data/raw/combined")
  
} else {
  
  print("directory 'data/raw/combined' already created")
  
}

fs::file_move(path = fs::dir_ls("data/raw/kajombo Maize Mill/Kajombo_husk/"), 
              new_path = "data/raw/combined/")

fs::file_move(path = fs::dir_ls("data/raw/kajombo Maize Mill/Kajombo_Top/"), 
              new_path = "data/raw/combined/")

fs::file_move(path = fs::dir_ls("data/raw/kajombo Maize Mill/kajombo_Win/"), 
              new_path = "data/raw/combined/")

fs::dir_delete("data/raw/kajombo Maize Mill")


raw_data_txt <- fs::dir_ls("data/raw/combined/")

raw_data_txt_paths <- path(here::here(raw_data_txt))

raw_data_list <- list()

for (i in seq_along(raw_data_txt)) {
  raw_data_list[[i]] <- read_csv(file = here::here(raw_data_txt)[[i]], 
                                 col_names = c("pm10", "pm2.5", "date_time")) %>% 
    select(-X4) %>% 
    mutate(path = raw_data_txt[[i]]) %>% 
    mutate(pm2.5 = as.double(pm2.5)) %>% 
    mutate(pm10 = as.double(pm10)) 
} 

dat_clean <- bind_rows(raw_data_list) %>% 
  # reprex help: https://stackoverflow.com/a/35547485/6816220
  mutate(location = str_extract(string = path, pattern = "(?!.*/).+")) %>% 
  separate(col = location, into = c("id", "location")) %>% 
  select(-path, -id) %>% 
  mutate(location = case_when(
    location == "Top" ~ "top",
    location == "win" ~ "window",
    TRUE ~ location)) %>% 
  pivot_longer(cols = pm2.5:pm10, names_to = "indicator", values_to = "value") %>% 
  mutate(unit = "uq_m3")
  

write_csv(x = dat_clean, file = "data/intermediate/malawi-maize-mills-air-quality.csv")

