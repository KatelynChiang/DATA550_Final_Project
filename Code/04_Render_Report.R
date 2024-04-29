library(here)
library(readr)
library(magrittr)
library(dplyr)
library(gtsummary)
library(ggplot2)
library(ggrepel)
library(rmarkdown)
library(knitr)
library(yaml)

here::i_am("Code/04_Render_Report.R")

render("report.Rmd",knit_root_dir = here::here())
