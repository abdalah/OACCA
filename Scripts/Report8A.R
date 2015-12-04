library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning8A.R')

for (prog in unique(df$program)){

  rmarkdown::render('Scripts/Report8A.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 8 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')
}
