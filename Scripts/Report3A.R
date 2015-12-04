library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning3A.R')

for (prog in unique(df$program)){

  rmarkdown::render('Scripts/Report3A.Rmd',  # file 3
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 3 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')

}
