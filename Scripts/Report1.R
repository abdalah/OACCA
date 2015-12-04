library(knitr)
library(markdown)
library(rmarkdown)

#This is the data file that we use to get the data and prepare it to later create tables from the dataframes
source('Scripts/DataCleaning1.R')


for (prog in unique(df$program_loop)){

    rmarkdown::render('Scripts/Report1.Rmd',  # file 2
                      output_format = "pdf_document",
                      output_file = paste("Report 1 - Agency ", prog, ".pdf", sep=''),#The name of the file
                      output_dir = paste("Output/Agency ",unique(na.omit(as.numeric(unlist(strsplit(unlist(prog), "[^0-9]+"))))), sep = "" ))
                      #The name of the directory

}
