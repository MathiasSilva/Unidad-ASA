
#Previo: Tener convertida las bases de g_genactual, g_actividades_de_una_gen, g_egre_anio,y g_carcic, para el año y servicio a usar. Tenerlas todas en una misma carpeta
#Directorio: directorio de las bases a usar.
rm(list=ls())
gc()
library(plyr)
directorio<-"C:/Users/Administrativo/Documents/Unidad ASA/ESENCIALES/Bases/Area Social/conversion ccee"
base_egresos<-"g_egre_anio_1985_2016_conv.csv"
gen1<-1985
gen2<-2015
setwd(directorio)
for(j in gen1:gen2){
gen<-j
rm(list=ls()[which(ls()%in%c("gen","base_egresos","gen1","gen2")==F)])
gc()
genact<-read.csv(paste("g_gen",gen,"_conv.csv",sep=""))
egresos<-read.csv(base_egresos)
carreras<-read.csv("g_carcic_conv.csv")
actividad<-read.csv(paste("g_actividades_de_una_gen_",gen,"_conv.csv",sep=""))
egresos<-egresos[,which(colnames(egresos)!="X")]
carreras<-carreras[,which(colnames(carreras)!="X")]
genact<-genact[,which(colnames(genact)!="X")]
actividad<-actividad[,which(colnames(actividad)!="X")]
#Pegado con la base de egreso
#Pegado de base egreso con base carreras#
colnames(carreras)[which(colnames(carreras)=="CICLO")][1]<-"CODCICLO"
colnames(carreras)[which(colnames(carreras)=="NOMCAR" | colnames(carreras)=="NOMCIC")]<-c("CARRERA","CICLO")

egresos<-join(egresos,carreras,by=c("CARRERA","CICLO"))
#Identificado de cedulas/nombres de base egresos en base genactual#

genact<-join(genact,egresos,by="NOMBRE")
colnames(genact)<-c("ESTCI","CI_DIGITO","NOMBRE","DIR","TEL","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","S","LUGAR_NACIMIENTO","FECHA_NACIMIENTO","FECHA_EGRESO","TELEFONO","DIRECCION","MAIL","CODCARR_EGRESO","CODCICLO_EGRESO") 
#Numero de egresos por estudiante
egresosCuenta<-function(x){ifelse(dim(table(as.character(x$CARRERA_EGRESO)))==0,0,length(names(table(as.character(x$CARRERA_EGRESO)))))}
EGRESOS_T<-as.data.frame(as.matrix(ddply(genact,.variables=c("ESTCI"),.fun=egresosCuenta)))
colnames(EGRESOS_T)<-c("ESTCI","EGRESOS_T")
genact<-join(genact,EGRESOS_T,by=c("ESTCI"))
egresosDatosPrimero<-function(x){
if(sum(x$EGRESOS_T)==0){
out<-rep(0,6)
}
else{
out<-x[which(x$FECHA_EGRESO==min(x$FECHA_EGRESO)),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
}
return(out)
}
egresosDatosSegundo<-function(x){
if(sum(x$EGRESOS_T)==0){
out<-rep(0,6)
}
else{
out<-x[which(x$FECHA_EGRESO==sort(x$FECHA_EGRESO)[2]),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
}
return(out)
}
#egresosDatosTercero<-function(x){
if(sum(x$EGRESOS_T)==0){
out<-rep(0,6)
}
else{
out<-x[which(x$FECHA_EGRESO==sort(x$FECHA_EGRESO)[3]),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
}
return(out)
}
#egresosDatosCuarto<-function(x){
if(sum(x$EGRESOS_T)==0){
out<-rep(0,6)
}
else{
out<-x[which(x$FECHA_EGRESO==sort(x$FECHA_EGRESO)[4]),c("ESTCI","ANO_EGRESO","CARRERA_EGRESO","CICLO_EGRESO","FECHA_EGRESO","CODCARR_EGRESO","CODCICLO_EGRESO")]
}
return(out)
}

PRIMER_EGRESO<-do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosPrimero))
SEGUNDO_EGRESO<-do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosSegundo))
#TERCER_EGRESO<-do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosTercero))
#CUARTO_EGRESO<-do.call(rbind,dlply(genact,.variables=c("ESTCI"),.fun=egresosDatosCuarto))
colnames(PRIMER_EGRESO)<-c("ESTCI","ANO_EGRESO_1","CARRERA_EGRESO_1","CICLO_EGRESO_1","FECHA_EGRESO_1","CODCARR_EGRESO_1","CODCICLO_EGRESO_1")
colnames(SEGUNDO_EGRESO)<-c("ESTCI","ANO_EGRESO_2","CARRERA_EGRESO_2","CICLO_EGRESO_2","FECHA_EGRESO_2","CODCARR_EGRESO_2","CODCICLO_EGRESO_2")
genact<-join(genact,PRIMER_EGRESO,by=c("ESTCI"))
genact<-join(genact,SEGUNDO_EGRESO,by=c("ESTCI"))
genact<-genact[,c("ESTCI","CI_DIGITO","NOMBRE","DIR","TEL","ANO_EGRESO_1","CARRERA_EGRESO_1","CICLO_EGRESO_1","FECHA_EGRESO_1","CODCARR_EGRESO_1","CODCICLO_EGRESO_1","ANO_EGRESO_2","CARRERA_EGRESO_2","CICLO_EGRESO_2","FECHA_EGRESO_2","CODCARR_EGRESO_2","CODCICLO_EGRESO_2")]
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
actividad<-actividad[,c("ident1","ESTCI","CI_DIGITO","NOMBRE","carr","ciclo","mat","nota","tipo_act","fecha","año_act","FECHA_EGRESO_1","ANO_EGRESO_1","CODCARR_EGRESO_1","CODCICLO_EGRESO_1","CARRERA_EGRESO_1","CICLO_EGRESO_1","FECHA_EGRESO_2","ANO_EGRESO_2","CODCARR_EGRESO_2","CODCICLO_EGRESO_2","CARRERA_EGRESO_2","CICLO_EGRESO_2")]
##############Salida###############
write.csv(actividad,paste("actividad con egresos filtrada gen ",gen,".csv",sep=""))
}


#Errores de clasificacion?#
#View(actividad.ccee.2012[which(actividad.ccee.2012$EN_BASEGEN==99 & actividad.ccee.2012$g2012==1),])