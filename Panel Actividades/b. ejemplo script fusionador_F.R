############################
#    FusionaServicios      #
############################
# Fusiona las bases que surgen de "a. Filtado y pegado actividad egreso genactual_F.R"
# para todos las gens de un servicio.
# Toma como input las bases actividad con egresos filtrada gen.csv.
# Genera como output una única base por servicio.

FS = function(dir.i, j, anio1, anio2, dir.o){
setwd(paste(as.character(dir.i), j, sep=""))  
index1<-seq(1985,2016,1)
for(i in 1:length(index1)){
assign(paste("base",index1[i],sep=""),read.csv(paste("actividad con egresos filtrada gen ",index1[i],".csv",sep=""),row.names=1))
assign(paste("base",index1[i],sep=""),cbind.data.frame(get(paste("base",index1[i],sep="")),"basegen"=rep(index1[i],nrow(get(paste("base",index1[i],sep=""))))))
}
baseglobal<-base1985
for(i in 2:length(index1)){
baseglobal<-rbind.data.frame(baseglobal,get(paste("base",index1[i],sep="")))
do.call("rm", list(paste("base",index1[i],sep="")))
}
write.csv(baseglobal,paste(as.character(dir.o),"actividad_egresos_85_16_",j,".csv",sep=""))
}

