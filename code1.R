# 
# ################################################################################
# ##### SECTEUR DE COMMERCE
# 
# 
# sectA_1 <- c(102, 225, 125, 350)
# sectA_2 <- c(130, 0, 75, 335)
# sectB_1 <- c(112, 220, 0, 50)
# sectB_2 <- c(75, 105, 35, 0)
# 
# 
# trade_data <- as.data.frame(cbind(sectA_1, sectA_2, sectB_1, sectB_2))
# 
# class(trade_data)
# dim(trade_data)
# ##########################################
# ## Total ACHAT ET VENTE
# 
# rownames(trade_data) <- c("SectA_1", "SectA_2", "SectB_1", "SectB_2")
# 
# achat <- colSums(trade_data)
# achat
# vente <- rowSums(trade_data)
# achat
# ## Total Import & Export
# 
# import <- colSums(trade_data[3:4 , ])
# import
# plot(import, type = "l")
# export <- rowSums(trade_data[ , 3:4])
# export
# 
# #### NET EXPORT/IMPORT
# 
# expA1 <- export[1] - import[1] ## SECT A1
# expA1
# expA2 <- export[2] - import[2] ## SECT A2
# expA2
# 
# expECON1 <- expA1 + expA2      ## ECON A
# expECON1
# 
# ## export - import
# 
# plot(export-import, type = "l")


##############################################
##############################################
#### STATISTIQUE DE L'EDUCATION

install.packages("devtools")
library(devtools)
install.packages("tidyverse")

library(tidyverse)

data <-read_csv("data_education.csv", col_types = "n")

data <- tibble(data)

class(data)

view(data)

##### SEX MASCULIN
E_Mm <- max(data$`Sexe M`) 

E_Mm

raw_max_M <- which(data$`Sexe M` == 44.2)

raw_max_M

Mm <- data$Age[raw_max_M]

Mm

Am <- Mm + (1/E_Mm)*sum(data$`Sexe M`[8:16])

Am

#### SEX FEMININ

E_Mf <- max(data$`Sexe F`)

E_Mf

Mf <- data$Age[which(data$`Sexe F`== 48)]

Mf


Af <- Mf + (1/E_Mf)*sum(data$`Sexe M`[1:7])

Af

############# Regression 

a <- rnorm(20, 0, 1)
a
plot(density(a))
hist(a)

b <- runif(20)
hist(b)

c <- rnorm(20)
hist(c)
plot(density(c))


### Creer un data frame avec x, y et z
### ajouer une colonne avec les années
### resumer un tableux avec min, max, moyenne et ecart types
### visuaier les variables 
# ggplot(tibble(a,b,c, d=(1:20))) + 
#   geom_line(mapping = aes(x= d, y = a ))+
#   geom_col(aes(x=d, y =b), color = "red")+
#   geom_point(aes(x=d, y=c), color ="blue")

### Mener une analyse qui predit les effets de a et b sur c en terme d'associations????
### interpreter!!!
