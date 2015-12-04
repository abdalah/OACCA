library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning4A.R')

for (prog in unique(df$program.intake)){

    rmarkdown::render('Scripts/Report4A.Rmd',  # file 2
      output_format = pdf_document(latex_engine='pdflatex'),
      output_file = paste("Report 4 - ", prog, ".pdf", sep=''),
      output_dir = 'Output/Aggregate/')

}
