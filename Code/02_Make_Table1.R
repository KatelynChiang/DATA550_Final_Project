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

here::i_am("Code/02_Make_Table1.R")

clinic <- read_csv(file = here::here("Data/synthetic_data.csv"))

Table1 <- clinic %>%
  filter(Year==2023) %>%
  mutate(Weight_Status= factor(Weight_Status, levels = c("Underweight", "Healthy Weight", "Overweight", "Obesity")), 
         Age_Group = factor(Age_Group, levels = c("2-5 years", "6-11 years", "12-19 years")),
         Sex = factor(Sex, levels = c("Male", "Female")),
         Race_Ethnicity = factor(Race_Ethnicity, levels = c("Hispanic", "White", "Black")),
         Insurance = factor(Insurance, levels = c("Medicaid", "Commercial"))
  ) %>%
  select(Weight_Status, Age_Group, Sex, Race_Ethnicity, Insurance) %>%
  tbl_summary(
    by = Weight_Status,
    percent = "row",
    missing = "no",
    label = list(Weight_Status ~ "Weight Status", 
                 Race_Ethnicity ~ "Race/ethnicity",
                 Age_Group ~ "Age",
                 Sex ~ "Sex",
                 Insurance ~ "Insurance"),
    digits = list(Weight_Status ~ c(0, 1), 
                  Race_Ethnicity ~ c(0, 1),
                  Age_Group ~ c(0, 1), 
                  Sex ~ c(0, 1), 
                  Insurance ~ c(0, 1))
  ) %>%
  modify_caption("**Table 1. Local Pediatric Primary Care Clinic patient population weight Status by sociodemographic characteristics, 2023**")

saveRDS(
  Table1,
  file = here::here("Output/Table1.rds")
)