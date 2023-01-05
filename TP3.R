################################################
### Installer le Package tidyverse

install.packages("tidyvers")

### Appeler la library tidyverse

library(tidyverse)

### Crééer le tableau de l'exercice

data <- cbind(age=c("inf 15", "entr 15/60", "sup 60"),
                    dece=c(15000, 10000, 50000),
                    pop=c(1000000, 2500000, 500000))
###définier comme data.frame tilisant as.tibble

data <- as.tibble(data)
view(data)
class(data$pop)

### Coecer les variables aux numeriques 

data$dece <- as.numeric(data$dece)
data$pop <- as.numeric(data$pop)

### somme sur mes colonnes

cs <- colSums(data[ , c("dece", "pop")])
cs
total <- c("total", cs)
total

### Calculer les indicateurs

inf_15 <- (data$dece[1]/data$pop[1])*100
inf_15
sup_60 <- (data$dece[3]/data$pop[3])*100
sup_60
inf_15 > sup_60
inf_15 < sup_60

?data.frame
