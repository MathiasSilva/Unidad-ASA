##############################
#     g_datosgen
##############################
lee_datosgen = function(dir.i, j, anio1, anio2, dir.o){
  library(stringr)
  setwd(paste(as.character(dir.i), j, sep=""))
  datosgen = data.frame()
  for(i in seq(anio1,anio2,1)){
    base = data.frame(scan(file = paste("g_datosgen/g_datosgen_",j,"_",i,".LST",sep=""), encoding ="latin1", flush = TRUE,  fill=TRUE, blank.lines.skip = TRUE,
                           what=list(estci="", aux =""), sep ="\t", quote=""))
    
    cell.widths<-c(nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][1]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][2]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][3]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][4]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][5]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][6]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][7]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][8]),
                   nchar(strsplit(as.character(base[2,1]),split = " ")[[1]][9]))
    cs = cumsum(cell.widths+1) 
    base = base[-c(1,2,nrow(base)),]  
    base$estci = as.character(base$estci)
    
    base$CEDULA          =  str_trim(substr(base$estci,1,cs[1]))
    base$DIGITO          =  str_trim(substr(base$estci,cs[1],cs[2]))
    base$NOMBRE          =  str_trim(substr(base$estci,cs[2],cs[3]))
    base$S               =  str_trim(substr(base$estci,cs[3],cs[4]))
    base$FNACIMIENTO     =  str_trim(substr(base$estci,cs[4],cs[5]))
    base$TELEFONO        =  str_trim(substr(base$estci,cs[5],cs[6]))
    base$LUGAR           =  str_trim(substr(base$estci,cs[6],cs[7]))
    base$ANIOFINESTUDIOS =  str_trim(substr(base$estci,cs[7],cs[8]))
    base$INSTITUTO       =  str_trim(substr(base$estci,cs[8],cs[9]))
    
    base = base[,-c(1,2)]
    base$GEN = i
    base$SERVICIO = j 
    write.csv(base, paste(as.character(dir.o),j,"/g_datosgen/g_datosgen_",j,"_",i,"_conv.csv",sep="")) 
    datosgen = rbind(datosgen,base)
  }
  return(datosgen)
}