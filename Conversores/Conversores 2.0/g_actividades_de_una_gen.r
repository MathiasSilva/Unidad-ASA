rm(list=ls());gc()
directorio<-"C:\\Users\\Administrativo\\Documents\\Unidad ASA\\trash\\CCEE\\g_actividades_de_una_gen"
setwd(directorio)
library(memisc)
library(zoo)
anio1<-1985
anio2<-1985
for(i in seq(anio1,anio2,1)){
base<-data.frame(scan(file = paste("g_actividades_de_una_gen_",i,".LST",sep=""), flush = TRUE,  fill=TRUE, blank.lines.skip = TRUE,
            what=list(ci = "", carr = "", ciclo = "", mat = "", tipo_act = "",nota = "", fecha = ""), sep =","))[-c(1:12),]
base<-apply(base,2,trimws)
base<-base[-c(which(base[,"ci"]=="" & base[,"fecha"]=="")),]
base[which(base=="")]<-NA
base[,"ci"]<-na.locf(base[,"ci"])
base<-base[-c(which(is.na(base[,"carr"]) & is.na(base[,"fecha"]))),]
write.csv(base,paste("g_actividades_de_una_gen_",i,"_conv.csv",sep=""))
}
