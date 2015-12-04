library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning12A.R')

for (prog in unique(program_loop)){

  rmarkdown::render('Scripts/Report12A.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 12 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')

}
