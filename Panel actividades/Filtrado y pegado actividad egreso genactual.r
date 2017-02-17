
#Previo: Tener convertida las bases de g_genactual, g_actividades_de_una_gen, g_egre_anio,y g_carcic, para el año y servicio a usar. Tenerlas todas en una misma carpeta
#Directorio: directorio de las bases a usar.
#gen: año de generacion de base a convertir
directorio<-"C:\\Users\\areasocial\\Documents\\Mesareasocial\\Mesareasocial\\Consultas SGB\\Consultas\\Procedimientos\\Filtrado y pegado actividad egreso genactual"
setwd(directorio)
genact<-read.csv("g_gen1990_conv.csv",header=T)
egresos<-read.csv("g_egre_anio_1957_2016_conv.csv")
carreras<-read.csv("g_carcic_conv.csv")
actividad<-read.csv("g_actividades_de_una_gen_1990_conv.csv")
gen<-1990

#Pegado con la base de egreso
#Pegado de base egreso con base carreras#
ind1<-rep(0,nrow(egresos))
for(i in 1:nrow(egresos)){
  ind1[i]<-which(as.character(carreras$NOMCAR)==as.character(egresos$CARRERA[i]))[1]
}
ind2<-rep(0,nrow(egresos))
for(i in 1:nrow(egresos)){
  ind2[i]<-which(as.character(carreras$NOMCIC)==as.character(egresos$CICLO[i]))[1]
}
egresos$CARR<-carreras$CARR[ind1]
egresos$CIC<-carreras$CICLO[ind2]
#Identificado de cedulas/nombres de base egresos en base genactual#
ind3<-which((as.character(egresos$NOMBRE)%in%as.character(genact$NOMBRE)))
ind4<-rep(0,length(ind3))
for (i in 1:length(ind3)){
ind4[i]<-which(as.character(genact$NOMBRE)==as.character(egresos[ind3[i],"NOMBRE"]))
}
genact$ANO_EGRESO<-rep(0,dim(genact)[1])
genact$ANO_EGRESO[ind4]<-egresos[ind3,"ANO_EGRESO"]
genact$CARR_EGRESO<-rep(0,dim(genact)[1])
genact$CARR_EGRESO[ind4]<-egresos[ind3,"CARR"]
genact$CIC_EGRESO<-rep(0,dim(genact)[1])
genact$CIC_EGRESO[ind4]<-egresos[ind3,"CIC"]

#Cargado de la base de actividad#
#mirando solo la generacion que se define como aquellos que tienen base de actividad en el año de g_genactual#
actividad$genact<-ifelse(actividad$ci%in%genact$ESTCI,1,0)
View(actividad[which(actividad$genact==1),])
#año de la actividad
actividad$año_act<-round(actividad$fecha/10000)
#actividades por año para esta definicion de generacion
table(actividad[which(actividad$genact==1),]$año_act)
#Cuantos estudiantes tengo en definitiva que estoy seguro son genactual?
table(duplicated(actividad[which(actividad$genact==1),"ci"]))
#...1658$
actividad$ident1<-rep(0,nrow(actividad))
actividad$ident1[which(actividad$genact==1)]<-ifelse(duplicated(actividad[which(actividad$genact==1),"ci"])==FALSE,1,0)


ind5<-rep(0,nrow(actividad))
for(i in 1:nrow(actividad)){
ind5[i]<-ifelse(TRUE%in%(genact$ESTCI==actividad$ci[i]),which(genact$ESTCI==actividad$ci[i]),99)
}

actividad$ANO_EGRESO<-rep(0,nrow(actividad))
actividad$EN_BASEGEN<-ind5
actividad$ANO_EGRESO<-genact$ANO_EGRESO[actividad$EN_BASEGEN]
#for(i in 1:nrow(actividad)){
#actividad$ANO_EGRESO[i]<-genact$ANO_EGRESO[actividad$EN_BASEGEN[i]]
#}


actividad$CARR_EGRESO<-rep(0,nrow(actividad))
actividad$CARR_EGRESO<-genact$CARR_EGRESO[actividad$EN_BASEGEN]
#for(i in 1:nrow(actividad)){
#actividad$CARR_EGRESO[i]<-genact$CARR_EGRESO[actividad$EN_BASEGEN[i]]
#}

actividad$CIC_EGRESO<-rep(0,nrow(actividad))
actividad$CIC_EGRESO<-genact$CIC_EGRESO[actividad$EN_BASEGEN]
#for(i in 1:nrow(actividad)){
#actividad$CIC_EGRESO[i]<-genact$CIC_EGRESO[actividad$EN_BASEGEN[i]]
#}

#Duracion de la carrera#
actividad$DURACION_EGRESO<-actividad$ANO_EGRESO-gen
##############Salida###############
write.csv(actividad[which(actividad$genact==1),],paste("actividad con egresos filtrada gen ",gen,".csv",sep=""))










#Errores de clasificacion?#
#View(actividad.ccee.2012[which(actividad.ccee.2012$EN_BASEGEN==99 & actividad.ccee.2012$g2012==1),])