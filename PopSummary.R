library(readr)
library(readxl)
library(magrittr)

pops <- read_excel("Populations-in-NE.xlsx", col_names = FALSE, na = c("", "NA")) %>%
  write_csv("NEpops.csv")

colnames(pops) <- c("city", "pop")
pops$percentile <- ecdf(pops$pop)(pops$pop)
pops$percentage <- 100*pops$pop/(sum(pops$pop))

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

Sch <- grep("Schuyler", pops$city, fixed = FALSE)
Has <- grep("Hastings", pops$city, fixed = FALSE)
NPl <- grep("North Platte", pops$city, fixed = FALSE)
Fre <- grep("Fremont", pops$city, fixed = FALSE)
WPo <- grep("West Point", pops$city, fixed = FALSE)
Mad <- grep("Madison", pops$city, fixed = FALSE)

sel <- pops[c(Lex, Nor, Win, Sco, Cre, Sch, Has, NPl, Fre, WPo, Mad),]
index <- sort(sel$percentile, index.return = TRUE)$ix
sel <- sel[index,]
sel %>% write_csv("selected-cities.csv")
    