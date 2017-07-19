############################
#       genactual
############################
lee_gen = function(dir.i, j, anio1, anio2, dir.o){
  library(stringr)
  setwd(paste(as.character(dir.i), j, sep=""))
  genactual = data.frame()
  for(i in seq(anio1,anio2,1))
  {
    base = data.frame(scan(file = paste("g_genactual/g_gen",i,".LST",sep=""), encoding ="latin1", flush = TRUE,  fill=TRUE, blank.lines.skip = TRUE,
                           what=list(estci="",dig="", nom="", dir="", tel=""), sep ="\t", quote=""))
    
    base$GEN = i
    d  = base[-(1:2),]  # Revisar los puntos de corte cada vez que se corre con datos nuevos.
    
    # A mano - Revisar los puntos de corte cada vez que se corre con datos nuevos.
    d$ESTCI    = str_trim(substr(d$estci,1,18))
    d$DIGITO   = str_trim(substr(d$estci,19,19))
    d$NOMBRE   = str_trim(substr(d$estci,21,81))
    d$DIR      = str_trim(substr(d$estci,82,132))
    d$TEL      = str_trim(substr(d$estci,133,150))
    d = d[,c("ESTCI","DIGITO","NOMBRE","DIR","TEL","GEN")]
    d$SERVICIO = j
    write.csv(d, paste(as.character(dir.o),j,"/g_genactual/g_gen",i,"_con.csv"))
    genactual = rbind(genactual,d)
  }
  return(genactual)
}