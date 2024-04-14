library(tidyverse)
library(dplyr)
library(gtsummary)
library(ggplot2)
library(gt)
library(readxl)
library(data.table)
library(ggrepel)
library(knitr)
library(yaml)
library(rmarkdown)
library(here)

here::i_am("Code/01_Calculate_Obesity_Prevalence.R")

clinic <- read_csv(file = here::here("Data/synthetic_data.csv"))

clinic_obesity_prevalence <- clinic %>%
  group_by(Year) %>%
  count(Weight_Status) %>%
  mutate(Percent = (n/sum(n))*100) %>%
  filter(Weight_Status == 'Obesity') %>%
  mutate(across('Percent', round, 1))

saveRDS(
  clinic_obesity_prevalence,
  file = here::here("Output/Clinic_Obesity_Prevalence.rds")
)
