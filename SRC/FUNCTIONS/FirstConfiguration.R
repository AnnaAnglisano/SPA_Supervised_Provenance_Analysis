

cat("\n\n***\n INSTALANDO Y CARGANDO LIBRERIAS \n***\n")
############# REPASAR #################
# Para evitar instalar las librerias necesarias cada vez que ejecutamos el codigo realizamos la siguiente comprobacion
packages_to_check = c("MASS","randomForest","readxl","dummy","kknn","corrplot"
                      ,"ggplot2","gridExtra","caret","glmnet","e1071","ranger"
                      ,"DMwR2","Rtsne","RColorBrewer","rmarkdown","knitr")
packages_to_install = packages_to_check[!(packages_to_check %in% installed.packages()[,"Package"])]
# ,"XMLSchema"
if(length(packages_to_install)) install.packages(packages_to_install, repos="http://cran.rstudio.com/", dependencies = TRUE)
rm(packages_to_check,packages_to_install)


# Cargamos librerias
library(MASS)
library(randomForest)
library(readxl)
library(dummy)
library(kknn)
library(corrplot)
library(ggplot2)
library(gridExtra)
library(caret)
library(glmnet)
library(e1071)
library(ranger)
library(DMwR2)
library(Rtsne)
library(RColorBrewer)
library(rmarkdown)
library(knitr)

cat("\nInstalacion de librerias completada con exito\n")