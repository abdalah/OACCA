library(knitr)
library(markdown)
library(rmarkdown)

source('Scripts/DataCleaning2.R')

for (prog in unique(df.cbecrb$program_loop)){

  rmarkdown::render('Scripts/Report2.Rmd',  # file 2
                    output_format = "pdf_document",
                    output_file = paste("Report 2 - Agency ", prog, ".pdf", sep=''),
                    output_dir = paste("Output/Agency ",unique(na.omit(as.numeric(unlist(strsplit(unlist(prog), "[^0-9]+"))))), sep = "" ))

}
