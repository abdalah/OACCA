library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning5A.R')

for (prog in unique(df.s$program)){

  rmarkdown::render('Scripts/Report5A.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 5 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')
}



