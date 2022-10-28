#2019-09-09 mickael.dinclaux@inra.fr

#Script to 

system("git pull")
# Reinitialize the session
rm(list=ls(all=TRUE))

library(gitter)

#############################################################
###                     Reading data                      ###
#############################################################

setwd("C:/Users/mdinclaux/Mes documents/Script/TWB_process/Gitter/")


data = "qtray.jpg"

f = file.path(getwd(), paste0(data))
f = system.file("extdata", "sample.jpg", package="gitter")
dat=gitter(f,
           plate.format = c(32,48))
dat = gitter( f,
          autorotate= T,
          plate.format = c(6,8),
          remove.noise = TRUE,
          verbose = "l",
          inverse = T,
          plot = TRUE)
browseURL(f)
browseURL(file.path(getwd(),
                   paste0("gridded_",
                         basename(f))))

summary(dat)
head(dat)