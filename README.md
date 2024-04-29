# DATA 550: Final Project (Katelyn Chiang)

------------------------------------------------------------------------

## Final Report Information

The final report can be generated using the contents of this directory:

  - The `Makefile` contains rules for generating targets that culminate in the Final Report. 
  - The `Dockerfile` contains commands for building a container with the appropriate software and packages needed to run this analysis. 
  - The `Code` folder contains various R scripts for different aspects of the analysis. 
  - The `Output` folder contains various results from different analyses that will be included when building the final report. 
  - The `Data` folder contains the raw data that will be used in the analysis. 
  
## Instructions for Building the Image (For Final Project 8: docker)

  **To build the image locally on your computer:**
  
  1. Clone the contents of this repository onto your local machine.
  2. Ensure you are in the correct working directory (project directory with appropriate project files).
  3. In the terminal, run `make project_image` to build the image that will have the necessary software and packages to run the analyses for this final report.
  
## Instructions for Generating the Final Report (For Final Project 8: docker)

There are 2 options for generating the final report. You can either pull or download the image from DockerHub and then use that image to run the container to automatically generate the final report. Alternatively, you can use the included Dockerfile found in this GitHub repository to build the image on your local machine before using that image to run the container and automatically generate the final report. 

### Option 1: Use the Image from DockerHub and Run 

  **If you are using a Mac or Linux operating system:**

  1. Clone the contents of this repository onto your local machine.
  2. Ensure you are in the appropriate working directory (project directory with appropriate project files).
  3. In the terminal, run `make pull_project_image` to pull the image from DockerHub that has the necessary software and packages to run the analysis. This is an optional step and is not necessary. 
  4. In the terminal, run `make mac_docker_image/report.html` to run the container and automatically generate the final report. You will find the final report .html file inside the "report" folder in the working directory on your local machine.
  
  **If you are using a Windows operating system:**

  1. Clone the contents of this repository onto your local machine.
  2. Ensure you are in the appropriate working directory (project directory with appropriate project files).
  3. In the terminal, run `make pull_project_image` to pull the image from DockerHub that has the necessary software and packages to run the analysis. This is an optional step and is not necessary. 
  4. In the terminal, run `make windows_docker_image/report.html` to run the container and automatically generate the final report. You will find the final report .html file inside the "report" folder in the working directory on your local machine.
  
  **[Link to image on DockerHub](https://hub.docker.com/r/katelynchiang/project_image)**

### Option 2: Build the Image Locally and Run 
  
  **If you are using a Mac or Linux operating system:**
  
  1. Clone the contents of this repository onto your local machine.
  2. Ensure you are in the correct working directory (project directory with appropriate project files).
  3. In the terminal, run `make project_image` to build the image that will have the necessary software and packages to run the analyses.
  4. In the terminal, run `make mac_report/report.html` to run the container and automatically generate the final report. You will find the final report .html file inside the "report" folder in the project directory on your local machine. 

  **If you are using a Windows operating system:**
  
  1. Clone the contents of this repository onto your local machine. 
  2. Ensure you are in the correct working directory (project directory with appropriate project files).
  3. In the terminal, run `make project_image` to build the container that will have the necessary software and packages to run the analyses.
  4. In the terminal, run `make windows_report/report.html` to run the container and automatically generate the final report. You will find the final report .html file inside the "report" folder in the project directory on your local machine. 
  
## Instructions for Generating the Final Report (For Final Project 6: renv)

  1. Ensure you are in the correct working directory.
  2. Ensure you have the renv package installed on your computer. 
  3. In the terminal, run `make install` to install necessary packages. 
  4. In the terminal, run `make report.html` to create the final report. 

## Code Description 

`Code/01_Calculate_Obesity_Prevalence.R`

  - Calculates the prevalence of obesity among Local Pediatric Primary Care Clinic patients for each year (2016-2023).
  - Saves prevalence information as an `.rds` object in the `Output/` folder.
  - Calculated prevalence information is later used to create Figure 1.

`Code/02_Make_Table1.R`

  - Creates **Table 1** which displays weight status of various sociodemographic groups in the Local Pediatric Primary Care Clinic patient population in 2023. The table displays the number (and row percents) of patients in each weight status category in various groups.
  - Saves table information as an `.rds` object in the `Output/` folder.
  
`Code/03_Make_Figure1.R`

  - Creates **Figure 1** which displays prevalence of obesity in the Local Pediatric Primary Care Clinic for each year 2016-2023. 
  - Saves figure information as an `.rds` object in the `Output/` folder.

`Code/04_Render_Report.R`

  - Creates the **Final Report** which includes introductory information and the results (Table 1 and Figure 1). 
  - Rendered report is saved as an `.html` file in the main folder. 

------------------------------------------------------------------------