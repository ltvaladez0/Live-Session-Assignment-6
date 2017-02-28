# Live-Session-Assignment-6

---------------------------------
Project: Rolling Sales for Queens
---------------------------------
Developed By:	Leticia Valadez
		Gerard Garza
		Daniel Freeman
		Sudip Bhattacharyya

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Objective:
----------

Analyze the property sale price according to squarefeet area for different categories of residence in different neighbourhoods of Queens, New York.



Directories & File Locations:
-----------------------------

The entire project was developed under the root directory "Project_RollingSalesQueens".

The root directory contains 3 sub-directories and 2 files and the project developed in R-Studio:

			-	Data (Directory): 	This directory contains data files
			-	Analysis (Directory):	This directory contains multiple output files and charts obtained in the process of analyzing our input dataset.
			-	Paper (Directory):	This directory contains a file explaining data pattern identified in input data.

			-	Project_RollingSalesQueens (Project):	This is the project developed to meet our objective with help of R-Studio.

			-	Readme_RollingSalesQueens.txt (File):	This is a text file that has all the required details on this project. 
									It guides users to identify all the file locations with a brief description on these files.
			-	Codes.R (File):				This is an 'R' file that contains all the codes used in this project.


Below are the brief descriptions on sub-directories:

1.	Data:		This directory contains both input and output datasets. It has 2 files:

			- rollingsales_queens.csv (Input):		This is an .csv file used as raw input in this project. 
									This file has 21 columns (or fields) and 26320 rows (or records).
			- CleanData_RollingSales_Queens.csv (Output):	This is the final output generated. With 'R' codes all the missing values and outliers has been removed.
									This file has 25 columns (or fields) and 9696 rows (or records).

2.	Analysis:	All the statistical analysis and charts/ diagrams are stored in Analysis directory. It contains 6 files in total:

			- RawDataSummary&Structure.txt:				This file has the exploratory anaylysis done on all the fields in raw input file 'rollingsales_queens.csv'.
			- SummaryforFamilyHomeswithSalesPricebelow100000.txt:	This file has the exploratory anaylysis done on all the fields based on the records which are 1/2/3 Family Home and has a sale price recorded less than $100,000.
			- Chart1_HistogramforSalePrice.jpg:			This chart contains a histogram drawn on sales price based on all records.
			- Chart2_PlotforGrossSQFTvsSalePrice.jpg:		This chart shows two diagrams - 
										a scatter plot of sales price plotted against gross square feet values for all records &
										a scatter plot of log-transformed sales price plotted against log-transformed gross square feet values for all records
			- Chart3_PlotforGrossSQFTvsSalePrice_forHomes.jpg:	It plots log-transformed sales price against log-transformed gross square feet based on all records for 1/2/3 family homes.
			- Chart4_SalePricePlot_CleanDataforHomes.jpg:		It plots log-transformed sales price against log-transformed gross square feet based on all records for 1/2/3 family homes without all outliers.



Logic to determine outliers:
----------------------------

Based on previous charts we decided to consider all records for 1/2/3 family homes with a sale price less than $100,000 outliers.
 
