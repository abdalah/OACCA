library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning9.R')

for (prog in unique(df$program_loop)){

  rmarkdown::render('Scripts/Report9.Rmd',  # file 2
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 9 - Agency ", prog, ".pdf", sep=''),
                    output_dir = paste("Output/Agency ",unique(na.omit(as.numeric(unlist(strsplit(unlist(prog), "[^0-9]+"))))), "/", sep = "" ))
}
