library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning10A.R')

for (prog in unique(df$program)){

  rmarkdown::render('Scripts/Report10A.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 10 - ", prog, ".pdf", sep=''),
                    output_dir = 'Output/Aggregate/')

}
