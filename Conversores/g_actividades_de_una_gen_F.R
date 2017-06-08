##############################
#   g_actvidades_de_una_gen  #
##############################

lee_act = function(dir.i , j, anio1, anio2, dir.o){
  library(memisc)
  library(zoo)
  # Poner dir = Directorio donde están todas las bases originales para cada servicio.
  setwd(paste(as.character(dir.i), j, sep=""))
  activs = data.frame()
  for(i in seq(anio1,anio2,1)){
    base<-data.frame(scan(file = paste("g_actividades_de_una_gen/g_actividades_de_una_gen_",i,".LST",sep=""), flush = TRUE,  fill=TRUE, blank.lines.skip = TRUE,
                          what=list(ci = "", carr = "", ciclo = "", mat = "", tipo_act = "",nota = "", fecha = ""), sep =","))
    base<-apply(base,2,trimws)
    base<-base[-c(which(base[,"ci"]=="" & base[,"fecha"]=="")),]
    base[which(base=="")]<-NA
    base[,"ci"]<-na.locf(base[,"ci"])
    base<-base[-c(which(is.na(base[,"carr"]) & is.na(base[,"fecha"]))),]
    base = as.data.frame(base)
    base$gen = i
    base$servicio = j
    write.csv(base,paste(as.character(dir.o),j,"/g_actividades_de_una_gen/g_actividades_de_una_gen_",j,"_",i,"_conv.csv",sep=""))
    activs = rbind(activs,base)
  }
  return(activs)
}