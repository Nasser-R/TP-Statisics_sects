

library(tidyverse)

trade <- read_csv(file = choose.files())

str(trade)


view(trade)

class(trade)


trd <- gather(trade, key = "Indicateurs", value = "Mnt", -Indicator)

view(trd)

ggplot(trd )+
  geom_line(aes(x= Indicator, y= Mnt, colour = Indicateurs))
