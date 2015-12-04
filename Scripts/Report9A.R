library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning9A.R')

for (prog in unique(df$program)){

  rmarkdown::render('Scripts/Report9A.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 9 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')
}
