#Report-associated rules

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

report.html: Code/04_Render_Report.R report.Rmd Output/Clinic_Obesity_Prevalence.rds Output/Table1.rds Output/Figure1.rds
	Rscript Code/04_Render_Report.R
  
Output/Clinic_Obesity_Prevalence.rds: Code/01_Calculate_Obesity_Prevalence.R Data/synthetic_data.csv
	Rscript Code/01_Calculate_Obesity_Prevalence.R
  
Output/Table1.rds: Code/02_Make_Table1.R Data/synthetic_data.csv
	Rscript Code/02_Make_Table1.R

Output/Figure1.rds: Code/03_Make_Figure1.R Output/Clinic_Obesity_Prevalence.rds Data/synthetic_data.csv
	Rscript Code/03_Make_Figure1.R

.PHONY: clean
clean:
	rm Output/*.rds
	
#Docker-associated rules
PROJECTFILES = report.Rmd Code/01_Calculate_Obesity_Prevalence.R Code/02_Make_Table1.R Code/03_Make_Figure1.R Code/04_Render_Report.R Makefile

#Rule to build image locally
project_image: Dockerfile $(PROJECTFILES)
	docker build -t project_image . 
	touch $@ #creates a blank file called project_image (the name of target)

#Rule to build the report automatically in container using local image (for Mac/Linux-OS machines)
mac_report/report.html: 
	docker run -v $$(pwd)/report:/home/rstudio/project/report project_image 
	
#Rule to build the report automatically in container using local image (for Windows-OS machines)
windows_report/report.html:
	docker run -v "/$$(pwd)/report":/home/rstudio/project/report project_image

#Rule to download the image from DockerHub: 
pull_project_image:
	docker pull katelynchiang/project_image

#Rule to build the report automatically in container using DockerHub image (for Mac/Linux-OS machines):
mac_docker_image/report.html:
	docker run -v $$(pwd)/report:/home/rstudio/project/report katelynchiang/project_image
	
#Rule to build the report automatically in container using DockerHub image (for Windows-OS machines):
windows_docker_image/report.html:
	docker run -v "/$$(pwd)/report":/home/rstudio/project/report katelynchiang/project_image

