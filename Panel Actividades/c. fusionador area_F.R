############################
#        FusionaÀrea       #
############################

FA = function(dir.i, j){
setwd(as.character(dir.i))
serv  = read.csv(paste("actividad_egresos_85_16_",j,".csv",sep=""))
serv$servicio = j
return(serv)
}


