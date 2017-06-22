##############################
#     g_egre_anio
##############################

egre = function(dir.i, j, anio1, anio2, dir.o)
{  
library(stringr)
library(foreign)

setwd(paste(as.character(dir.i), j, sep=""))

base = data.frame(scan(file = paste("g_egre_anio/g_egre_anio_",anio1,"_", anio2,"_",j,".LST",sep=""), encoding ="latin1", flush = TRUE,  fill=TRUE, blank.lines.skip = TRUE,
                           what=list(estci="", aux =""), sep ="\t", quote=""))
    
    cell.widths<-c(nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][1]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][2]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][3]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][4]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][5]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][6]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][7]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][8]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][9]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][10]),
                   nchar(strsplit(as.character(base[4,1]),split = " ")[[1]][11]))
                   
    cs = cumsum(cell.widths+1) 
    base = base[-c(1:4,nrow(base)),]  
    base$estci = as.character(base$estci)

    base$NOMBRE             =  str_trim(substr(base$estci,1,cs[1]))
    base$ANO_EGRESO         =  str_trim(substr(base$estci,cs[1],cs[2]))
    base$CARRERA            =  str_trim(substr(base$estci,cs[2],cs[3]))
    base$CICLO              =  str_trim(substr(base$estci,cs[3],cs[4]))
    base$S                  =  str_trim(substr(base$estci,cs[4],cs[5]))
    base$LUGAR_NACIMIENTO   =  str_trim(substr(base$estci,cs[5],cs[6]))
    base$FECHA_NACIMIENTO   =  str_trim(substr(base$estci,cs[6],cs[7]))
    base$FECHA_EGRESO       =  str_trim(substr(base$estci,cs[7],cs[8]))
    base$TELEFONO           =  str_trim(substr(base$estci,cs[8],cs[9]))
    base$DIRECCION          =  str_trim(substr(base$estci,cs[9],cs[10]))
    base$MAIL               =  str_trim(substr(base$estci,cs[10],cs[11]))

    base= base[,-c(1,2)]
    base$SERVICIO = j 
    write.csv(base, paste(as.character(dir.o),j,"/g_egre_anio/g_egre_anio_",anio1,"_", anio2,"_",j,"_conv.csv",sep="")) 
return(base)
}
