##############################
#     g_inscriptos
##############################
lee_insc = function(dir.i, j, fecha1, fecha2, dir.o){
library(foreign)
library(stringr)
library(memisc)
base = data.frame(scan(file = paste(as.character(dir.i),"g_inscriptos/g_inscriptos_",as.character(fecha1),"_",as.character(fecha2),".lst",sep=""), encoding ="latin1", flush = TRUE,  fill=TRUE, blank.lines.skip = TRUE,
                       what=list(estci="", aux =""), sep ="\t", quote=""))

base = base[-c(1,2),]
base = base[1:(which(grepl("filas seleccionadas",base[,1]) == TRUE)[1]-1),]

p.head1<-rep(0,nrow(base))
for(i in 1:length(p.head1)){
  p.head1[i]<-grepl("página",strsplit(as.character(base$estci[i])," "))
}
base<-base[-which(p.head1==T),]
p.head2<-rep(0,length(base$estci))
for(i in 1:length(p.head2)){
  p.head2[i]<-grepl("INSCRIPTOS",strsplit(as.character(base$estci[i])," "))
}
base<-base[-which(p.head2==T),]
cell.widths<-c(nchar(strsplit(as.character(base$estci[2]),split = " ")[[1]][1]),nchar(strsplit(as.character(base$estci[2]),split = " ")[[1]][2]),nchar(strsplit(as.character(base$estci[2]),split = " ")[[1]][3]),nchar(strsplit(as.character(base$estci[2]),split = " ")[[1]][4]),nchar(strsplit(as.character(base$estci[2]),split = " ")[[1]][5]),nchar(strsplit(as.character(base$estci[2]),split = " ")[[1]][6]))
p.head3<-rep(0,length(base$estci))
for(i in 1:length(p.head3)){
  p.head3[i]<-grepl("ESTCI",strsplit(as.character(base$estci[i])," "))
}
base<-base[-which(p.head3==T),]
p.head4<-rep(0,length(base$estci))
for(i in 1:length(p.head4)){
  p.head4[i]<-grepl("--",strsplit(as.character(base$estci[i])," "))
}
base<-base[-which(p.head4==T),]

cs = cumsum(cell.widths+1) 
base$estci = as.character(base$estci)

base$ESTCI          =  str_trim(substr(base$estci,1,cs[1]))
base$NOMBRE          =  str_trim(substr(base$estci,cs[1],cs[2]))
base$CARR             =  str_trim(substr(base$estci,cs[2],cs[3]))
base$CICLO     =  str_trim(substr(base$estci,cs[3],cs[4]))
base$FECHA        =  str_trim(substr(base$estci,cs[4],cs[5]))
base$OBS           =  str_trim(substr(base$estci,cs[5],cs[6]))

base=base[,-c(1,2)]

write.csv(base,paste(as.character(dir.o),"/g_inscriptos_",as.character(fecha1),"_",as.character(fecha2),"_consulta1_conv.csv",sep=""))
}
