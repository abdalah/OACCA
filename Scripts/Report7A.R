library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning7A.R')

for (prog in unique(df$program)){

  rmarkdown::render('Scripts/Report7A.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 7 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')
}
