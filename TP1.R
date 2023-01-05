##### Download the packages 
# install.packages(c("tidyverse", "XML", "rvest"))                 


library(tidyverse)
library(XML)
library(rvest)

url <- read_html("Knoema('MRSCD2015', list('timerange' = '2005-2015', 'Indicator' = 'KN.A130;KN.A131;KN.A132;KN.A139;KN.A142', 'Region' = 'MR'), host='mauritania.opendataforafrica.org')")
url <- read_html("https://mauritania.opendataforafrica.org/MRSCD2015/socio-economic-database-of-mauritania-2015")

chart <- url %>% html_table(fill = TRUE)

class(chart)

chart


install.packages("devtools")
library("devtools")
install_github("Knoema/knoema-r-driver", force = TRUE)
library(Knoema)

educ_data <- Knoema('MRSCD2015', list('timerange' = '2005-2015', 'Indicator' = 'KN.A130;KN.A131;KN.A132;KN.A142;KN.A143;KN.A144;KN.A139;KN.A140;KN.A141', 'Region' = 'MR'),
                    host='mauritania.opendataforafrica.org')
view(educ_data)
view(educ_data)

str(educ_data)

##### DATA WRANGLING 

library(dplyr)
str(educ_data)
class(educ_data)



sapply(educ_data, class)

educ_data$year <- c(2005:2009)
educ_data <- as_tibble(educ_data)

colnames(educ_data) <- c("TBS", "TBS Filles", "TBS Garçons", "TDR", "TNS", "Year")

educ_data <- educ_data %>% relocate(Year, .before= TBS)

#### Transformer les donnes en forme long shape
library(tidyr)

tidy <- gather(educ_data, key = "Indicateurs", value = "Ratio", -Year)

view(tidy)

ggplot(data = tidy)+
  geom_line(mapping = aes(x = Year, y = Ratio, colour = Indicateurs))


#### Calcule du Rapport entre TNS & TBS 
Rapport <- educ_data$TNS/educ_data$TBS
            
plot(Rapport*100)
