library(tmap)
library(maptools)
library(rgdal)
library(readxl)
IFDM_full <- read_excel("~/R/graficos/IFDM_full.xlsx")
IFDM_full[IFDM_full == "*"] <- NA

for (i in 3:14){
    IFDM_full[[i]] <- as.numeric(IFDM_full[[i]])
}

#unindo os dados
IFDM_full_mapMA=merge(mapMA,IFDM_full,by="CD_MUN", all.x=T)
names(IFDM_full_mapMA)

#plotando
tm_shape(IFDM_full_mapMA)+
tm_fill(col = c("2005","2011", "2016"), title = "IFDM - MA", palette="Greens")+
tm_format("World")+
tm_style("grey")+
tm_legend(position=c("left","bottom"))+
tm_compass(type = "rose")+
tm_scale_bar(text.size = 1)+
tm_borders(alpha=.5)+
tm_legend()+
tm_layout(legend.position = c("LEFT","BOTTOM"),
legend.frame = FALSE, title = c("2005","2011","2016"),
fontfamily = "serif", title.size = 1.5, legend.title.size = 1.5,
legend.text.size = 1)