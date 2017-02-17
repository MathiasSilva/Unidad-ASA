directorio<-"C:\\Users\\areasocial\\Documents\\Mesareasocial\\Mesareasocial\\Consultas SGB\\Procedimientos\\Bases actividad egreso genactual\\Derecho"
setwd(directorio)
index1<-seq(1985,2015,1)
for(i in 1:length(index1)){
assign(paste("base",index1[i],sep=""),read.csv(paste("actividad con egresos filtrada gen ",index1[i],".csv",sep=""),row.names=1))
assign(paste("base",index1[i],sep=""),cbind.data.frame(get(paste("base",index1[i],sep="")),"basegen"=rep(index1[i],nrow(get(paste("base",index1[i],sep=""))))))
}
baseglobal<-base1985
for(i in 2:length(index1)){
baseglobal<-rbind.data.frame(baseglobal,get(paste("base",index1[i],sep="")))
do.call("rm", list(paste("base",index1[i],sep="")))
}
write.csv(baseglobal,"actividad_egresos_85_15_derecho.csv")
library(foreign)
write.dta(baseglobal,"actividad_egresos_85_15_derecho.dta")