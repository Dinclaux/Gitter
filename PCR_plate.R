#2019-09-26 mickael.dinclaux@inra.fr

#Script to 


# Reinitialize the session
rm(list=ls(all=TRUE))

library(EBImage)

setwd("C:/Users/mdinclaux/Documents/Script/Gitter")


x = readImage(files = "Yeast_colonies_array_96_format.jpg", type = "jpg")


plot(x)
y = bwlabel(x)
normalize(y)
plot(y)

disc = makeBrush(size = 30, "disc",step=TRUE, sigma=0.3, angle=45)
disc = disc / sum(disc)
offset = 0.0001
y_bg = filter2( y, disc )
y_th = y > y_bg + offset
plot(y_th)

la = matrix(1, nc=3, nr=3)
la[2,2] = -5.5
y = filter2(y_th, la, boundary='replicate')
plot(y)

dat = gitter( y,
              autorotate= TRUE,
              plate.format = c(8,25), 
              remove.noise = TRUE,
              verbose = "l",
              inverse = F)