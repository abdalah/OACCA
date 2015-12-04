library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning1A.R')

for (prog in unique(df$program)){

    rmarkdown::render('Scripts/Report1A.Rmd',  # file 2
                      output_format = "pdf_document",
                      output_file = paste("Report 1 - ", prog, ".pdf", sep=''),
                      output_dir = 'Output/Aggregate/')

}
