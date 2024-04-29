#Build an image from rocker's r-studio base image 
FROM rocker/rstudio as base

#Manual installation of packages
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('readr')"
RUN Rscript -e "install.packages('magrittr')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('ggrepel')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('yaml')"

#Update packages and install other needed packages (dependencies)
RUN apt-get update && apt-get install -y pandoc zlib1g-dev libxml2-dev libv8-dev

RUN Rscript -e "install.packages('gtsummary')"

#Create a folder called "project" and set to working directory 
RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

#Create folders in the container that are needed and copy folders/files from local computer 
RUN mkdir Code
RUN mkdir Data
RUN mkdir Output
COPY Code Code
COPY Data Data
COPY Makefile . 
COPY report.Rmd . 

#Create a report folder in the container to house the final report 
RUN mkdir report 

#Add entry point to container
CMD make && mv report.html report
