# DATA 550: Final Project (Katelyn Chiang)

------------------------------------------------------------------------

## How to Generate the Final Report 

The final report can be generated using the contents of this directory:

  - The `Makefile` contains rules for generating targets that culminate in the Final Report. 
  - The `Code` folder contains various R scripts for different aspects of the analysis. 
  - The `Output` folder contains various results from different analyses that will be included when building the final report. 
  - The `Data` folder contains the raw data that will be used in the analysis. 
  
Instructions for creating the Final Report:

  1. Ensure you are in the correct working directory.
  2. Ensure you have the renv package installed on your computer. 
  3. In the terminal, run `make install` to install necessary packages. 
  4. In the terminal, run `make report.html`

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