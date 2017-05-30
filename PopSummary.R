library(readr)
library(readxl)
library(magrittr)

res <- read_excel("", sheet="single", na = c("Populations-in-NE.xlsx", "NA")) %>%
  write_csv("NEpops.csv")

##  RFA limits the small towns to being 50,000 or less

