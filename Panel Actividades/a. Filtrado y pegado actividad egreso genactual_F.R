############################
#    Filtrado y Pegado
############################
# Filtrado y pegado: actividad + egreso + genactual
# Previo: Tener convertidas las bases de g_genactual, g_actividades_de_una_gen, g_egre_anio,y g_carcic, 
# para el año y servicio a usar.

FyP = function(dir.i, j, anio1, anio2, dir.o){
library(plyr) # para la funciòn join
setwd(paste(as.character(dir.i), j, sep=""))
for(i in anio1:anio2){

# Base de Carreras-Ciclos
carreras = read.csv(paste("g_carcic_conv_",j,".csv",sep = ""),fileEncoding ="ISO-8859-1")
carreras = carreras[,which(colnames(carreras)!="X")]
  
# Base de Egresos
egresos  = read.csv(paste("g_egre_anio_1985_2016_conv_",j,".csv",sep=""),fileEncoding ="ISO-8859-1")
egresos  = egresos[,which(colnames(egresos)!="X")]  

# Base de Actividades
actividad = read.csv(paste("g_actividades_de_una_gen/g_actividades_de_una_gen_",j,"_",i,"_conv.csv",sep=""))
actividad = actividad[,which(colnames(actividad)!="X")]
actividad = actividad[,which(colnames(actividad)!="gen")]
actividad = actividad[,which(colnames(actividad)!="servicio")]

# Base Genactual
genact = read.csv(paste("g_genactual/g_gen",i,"_conv.csv",sep=""))
genact = genact[,which(colnames(genact) != "X")]
genact = genact[,which(colnames(genact) != "GEN")]
genact = genact[,which(colnames(genact) != "SERVICIO")]

# Pegado con la base de egreso
# Pegado de base egreso con base carreras#
colnames(carreras)[which(colnames(carreras)=="CICLO")]  = "CODCICLO"
colnames(carreras)[which(colnames(carreras)=="NOMCAR")] = "CARRERA"
colnames(carreras)[which(colnames(carreras)=="NOMCIC")] = "CICLO"

egresos$CARRERA  = as.character(egresos$CARRERA)
carreras$CARRERA = as.character(carreras$CARRERA)

egresos = join(egresos, carreras, by = c("CARRERA","CICLO"))
#Identificado de cedulas/nombres de base egresos en base genactual#

egresos$NOMBRE  = as.character(egresos$NOMBRE)
genact$NOMBRE   = as.character(genact$NOMBRE)

genact = join(genact, egresos, by="NOMBRE")
colnames(genact) = c("ESTCI","CI_DIGITO","NOMBRE","DIR","TEL","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","S","LUGAR_NACIMIENTO","FECHA_NACIMIENTO","FECHA_EGRESO","TELEFONO","DIRECCION","MAIL","CODCARR_EGRESO","CODCICLO_EGRESO") 

#Numero de egresos por estudiante
egresosCuenta<-function(x){ifelse(dim(table(as.character(x$CARRERA_EGRESO)))==0,0,length(names(table(as.character(x$CARRERA_EGRESO)))))}
EGRESOS_T<-as.data.frame(as.matrix(ddply(genact,.variables=c("ESTCI"),.fun=egresosCuenta)))
colnames(EGRESOS_T)<-c("ESTCI","EGRESOS_T")
genact<-join(genact,EGRESOS_T,by=c("ESTCI"))
genact$EGRESOS_T<-as.numeric(as.character(genact$EGRESOS_T))

egresosDatosPrimero<-function(x){
  if(max(as.numeric(as.character(x$EGRESOS_T)))==0){
    out<-c(as.numeric(as.character(x$ESTCI))[1],0,NA,NA,0,0,0)
  }
  else{
    out<-x[which(x$FECHA_EGRESO==min(x$FECHA_EGRESO)[1]),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
  }
  return(out)
}

egresosDatosSegundo<-function(x){
  if(max(as.numeric(as.character(x$EGRESOS_T)))<2){
    out<-c(as.numeric(as.character(x$ESTCI))[1],0,NA,NA,0,0,0)
  }
  else{
    out<-x[which(x$FECHA_EGRESO==sort(x$FECHA_EGRESO)[2]),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
  }
  return(out)
}

egresosDatosTercero<-function(x){
  if(max(as.numeric(as.character(x$EGRESOS_T)))<3){
    out<-c(as.numeric(as.character(x$ESTCI))[1],0,NA,NA,0,0,0)
  }
  else{
    out<-x[which(x$FECHA_EGRESO==sort(x$FECHA_EGRESO)[3]),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
  }
  return(out)
}

PRIMER_EGRESO<-as.data.frame(do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosPrimero)))[,1:7]
SEGUNDO_EGRESO<-as.data.frame(do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosSegundo)))[,1:7]
TERCER_EGRESO<-as.data.frame(do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosTercero)))[,1:7]

colnames(PRIMER_EGRESO)<-c("ESTCI","ANO_EGRESO_1","CARRERA_EGRESO_1","CICLO_EGRESO_1","FECHA_EGRESO_1","CODCARR_EGRESO_1","CODCICLO_EGRESO_1")
colnames(SEGUNDO_EGRESO)<-c("ESTCI","ANO_EGRESO_2","CARRERA_EGRESO_2","CICLO_EGRESO_2","FECHA_EGRESO_2","CODCARR_EGRESO_2","CODCICLO_EGRESO_2")
colnames(TERCER_EGRESO)<-c("ESTCI","ANO_EGRESO_3","CARRERA_EGRESO_3","CICLO_EGRESO_3","FECHA_EGRESO_3","CODCARR_EGRESO_3","CODCICLO_EGRESO_3")

genact<-join(genact,PRIMER_EGRESO,by=c("ESTCI"),match="first")
genact<-join(genact,SEGUNDO_EGRESO,by=c("ESTCI"),match="first")
genact<-join(genact,TERCER_EGRESO,by=c("ESTCI"),match="first")

genact = genact[,c("ESTCI","CI_DIGITO","NOMBRE","DIR","TEL","ANO_EGRESO_1","CARRERA_EGRESO_1","CICLO_EGRESO_1","FECHA_EGRESO_1","CODCARR_EGRESO_1","CODCICLO_EGRESO_1","ANO_EGRESO_2","CARRERA_EGRESO_2","CICLO_EGRESO_2","FECHA_EGRESO_2","CODCARR_EGRESO_2","CODCICLO_EGRESO_2","ANO_EGRESO_3","CARRERA_EGRESO_3","CICLO_EGRESO_3","FECHA_EGRESO_3","CODCARR_EGRESO_3","CODCICLO_EGRESO_3")]

#Cargado de la base de actividad#
#mirando solo la generacion que se define como aquellos que tienen inicio de actividades en el año de g_genactual#
actividad$genact<-ifelse(actividad$ci%in%genact$ESTCI,1,0)
actividad<-actividad[which(actividad$genact==1),]
#año de la actividad
actividad$año_act<-round(actividad$fecha/10000)
#identificador unico por persona/servicio
actividad$ident1<-rep(0,nrow(actividad))
actividad$ident1[which(actividad$genact==1)]<-ifelse(duplicated(actividad[which(actividad$genact==1),"ci"])==FALSE,1,0)
colnames(actividad)[which(colnames(actividad)=="ci")]<-"ESTCI"
actividad<-join(actividad,genact,by="ESTCI")
actividad<-actividad[,c("ident1","ESTCI","CI_DIGITO","NOMBRE","carr","ciclo","mat","nota","tipo_act","fecha","año_act","FECHA_EGRESO_1","ANO_EGRESO_1","CODCARR_EGRESO_1","CODCICLO_EGRESO_1","CARRERA_EGRESO_1","CICLO_EGRESO_1","FECHA_EGRESO_2","ANO_EGRESO_2","CODCARR_EGRESO_2","CODCICLO_EGRESO_2","CARRERA_EGRESO_2","CICLO_EGRESO_2","ANO_EGRESO_3","CARRERA_EGRESO_3","CICLO_EGRESO_3","FECHA_EGRESO_3","CODCARR_EGRESO_3","CODCICLO_EGRESO_3")]
##############Salida###############
#write.csv(actividad,paste("/home/grupos/asa/2017/4.FiltradoPegado/SGB/",j,"/actividad con egresos filtrada gen ",i,".csv",sep=""))
write.csv(actividad,paste(as.character(dir.o),j,"/actividad con egresos filtrada gen ",i,".csv",sep=""))
}
}


