rm(list=ls())
gc()
directorio<-"C:\\Users\\Administrativo\\Documents\\Unidad ASA\\trash\\CCEE\\g_genactual"
anio1<-1985
anio2<-1985
setwd(directorio)
#Primer Paso: Abrir el archivo .LST, eliminar la última línea y la primera hasta el primer número de cédula. Llenar con --- un renglon dejando solo un espacio en blanco entre variable y variable. Guardar como .txt.
#Nota: Si se corre para mas de un año, solo es necesario hacer el paso 1 para el archivo correspondiente al primer año del intervalo de las bases.
for(i in seq(anio1,anio2,1)){
if(i==anio1){
base<-read.table(paste("g_gen",i,".txt",sep=""), sep=";", quote="\"", na.strings="",header=F)
cell.widths<-c(nchar(strsplit(as.character(base[1,]),split = " ")[[1]][1]),nchar(strsplit(as.character(base[1,]),split = " ")[[1]][2]),nchar(strsplit(as.character(base[1,]),split = " ")[[1]][3]),nchar(strsplit(as.character(base[1,]),split = " ")[[1]][4]),nchar(strsplit(as.character(base[1,]),split = " ")[[1]][5]))
rm(base)
}
base<-read.fwf(paste("g_gen",i,".LST",sep=""),widths = cell.widths+1,header = F)
base<-base[which(is.na(base[,1])==F),]
func1<-function(x) {ifelse(is.na(x)|trimws(x)=="",T,F)}
base<-base[which(apply(apply(base,1,func1),2,sum)!=ncol(base)),]
colnames(base)<-c("ESTCI","CI_DIGITO","NOMBRE","DIR","TEL")
for(j in 1:ncol(base)){
  base[,j]<-sapply(as.character(base[,j]),trimws)
}
write.csv(base,paste("g_gen",i,"_conv",".csv",sep=""))
}
