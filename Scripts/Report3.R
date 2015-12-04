library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning3.R')

for (prog in unique(df$program_loop)){

  rmarkdown::render('Scripts/Report3.Rmd',  # file 3
                    output_format = pdf_document(latex_engine='pdflatex'),
                    output_file = paste("Report 3 - Agency ", prog, ".pdf", sep=''),
                    output_dir = paste("Output/Agency ",unique(na.omit(as.numeric(unlist(strsplit(unlist(prog), "[^0-9]+"))))), sep = "" ))

}
