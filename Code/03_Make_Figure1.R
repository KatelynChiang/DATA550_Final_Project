library(here)
library(readr)
library(magrittr)
library(dplyr)
library(gtsummary)
library(ggplot2)
library(ggrepel)
library(yaml)
library(rmarkdown)
library(knitr)

here::i_am("Code/03_Make_Figure1.R")

clinic_obesity_prevalence <- read_rds(file = here::here("Output/Clinic_Obesity_Prevalence.rds"))

Figure1 <- ggplot(clinic_obesity_prevalence, aes(x=Year, y=Percent)) +
  geom_line(color="#00A94F") +
  geom_point(color="#00A94F") +
  xlab("Year") +
  ylab("Obesity Prevalence (%)") +
  
  #Formatting 
  theme_classic()+
  theme(text=element_text(size=13,  family="Arial Rounded MT Bold")) +
  scale_x_continuous(n.breaks=10) +
  labs(title="Prevalence of obesity in Local Pediatric \nPrimary Care Clinic, 2016-2023") +
  theme(plot.title = element_text(hjust=0.5)) +
  
  #Truncating y-axis to better illustrate changes over time
  ylim(c(0, 50)) +
  labs(caption = "Note: Y-axis has been truncated.") +
  theme(plot.caption = element_text(hjust=0)) +
  theme(legend.position="bottom") +
  
  #Add labels to a few years. 
  geom_label_repel(
    data=clinic_obesity_prevalence %>% filter(Year==2016 | Year==2019 | Year==2021 | Year==2023),
    aes(label= sprintf('%0.1f', Percent)),
    size=3,
    nudge_x=0, nudge_y=2,
    show.legend = FALSE)

saveRDS(
  Figure1,
  file = here::here("Output/Figure1.rds")
)