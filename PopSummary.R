library(readr)
library(readxl)
library(magrittr)

pops <- read_excel("Populations-in-NE.xlsx", col_names = FALSE, na = c("", "NA")) %>%
  write_csv("NEpops.csv")

colnames(pops) <- c("city", "pop")


##  RFA limits the small towns to being 50,000 or less
## Proposed start date of September 30th

tot <- sum(pops$pop)  #197 towns total
sum(pops$pop > 50000) # 3 are >50,000
sum(pops$pop < 50000) # 194 are <50,000

194/197

Lex <- grep("Lexington", pops$city, fixed = FALSE)
Nor <- grep("Norfolk", pops$city, fixed = FALSE)
Win <- grep("Winnebago", pops$city, fixed = FALSE)
Sco <- grep("Scottsbluff", pops$city, fixed = FALSE)
Cre <- grep("Crete", pops$city, fixed = FALSE)

pops$percentile <- ecdf(pops$pop)(pops$pop)

