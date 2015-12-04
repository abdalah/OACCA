library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning2A.R')

for (prog in unique(df.cbecrb$program.intake)){

  rmarkdown::render('Scripts/Report2A.Rmd',  # file 2
                    output_format = "pdf_document",
                    output_file = paste("Report 2 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')

}
