library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning1A.R')

df <- df[ which(df$length.of.stay.months >= 1),]

for (prog in unique(df$program)){

    rmarkdown::render('Scripts/Report11A.Rmd',  # file 2
      output_format = pdf_document(latex_engine='pdflatex'),
      output_file = paste("Report 11 - ", prog, ".pdf", sep=''),
      output_dir = 'Output/Aggregate/')

}
