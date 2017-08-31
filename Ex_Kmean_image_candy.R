setwd("/Users/edward/Documents/Dropbox/The One With What I'm Working On/Teaching/2017/Clusters/Labs")

rm(list=ls())
graphics.off()

library(imager)

img <- load.image("candy.jpg")

par(mfrow=c(1,2))
plot(img,axes=F)
imgmat = matrix(img,nrow =510*340)

km_im = kmeans(imgmat,8,nstart = 10)
clus_im = matrix(km_im$cluster)
res_im = km_im$center[clus_im[1:(510*340)],]
pre_im = array(res_im,c(510,340,3))
fin_im = as.cimg(pre_im,dim=c(510,340,3))

plot(fin_im,axes=F)
