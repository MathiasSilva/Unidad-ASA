rm(list=ls())
gc()

# Directorio de origen y destino de los datos.
# Primer y último año de análisis.
dir.i = "/home/grupos/asa/2017/1.Datos Originales/SGB/" # Termina con /
anio1 = 1985
anio2 = 2016
dir.o = "/home/grupos/asa/2017/3.Bases Convertidas/SGB/" # Termina con /

##############################
#   g_actvidades_de_una_gen  #
##############################

source("/home/grupos/asa/2017/2.Conversores/Funciones/1. g_actividades_de_una_gen_F.R")
lee_act(dir.i , "CCEE" , anio1, anio2, dir.o) 
lee_act(dir.i , "ENBA" , anio1, anio2, dir.o)
lee_act(dir.i , "EUMUS", anio1, anio2, dir.o)
lee_act(dir.i , "FCS"  , anio1, anio2, dir.o)
lee_act(dir.i , "FDER" , anio1, anio2, dir.o)
lee_act(dir.i , "FHUCE", anio1, anio2, dir.o)
lee_act(dir.i , "FIC"  , anio1, anio2, dir.o)

##############################
#          g_datosgen        #
##############################

source("/home/grupos/asa/2017/2.Conversores/Funciones/2. g_datosgen_F.R")
lee_datosgen(dir.i , "CCEE" , anio1, anio2, dir.o) 
lee_datosgen(dir.i , "ENBA" , anio1, anio2, dir.o)
lee_datosgen(dir.i , "EUMUS", anio1, anio2, dir.o)
lee_datosgen(dir.i , "FCS"  , anio1, anio2, dir.o)
lee_datosgen(dir.i , "FDER" , anio1, anio2, dir.o)
lee_datosgen(dir.i , "FHUCE", anio1, anio2, dir.o)
lee_datosgen(dir.i , "FIC"  , anio1, anio2, dir.o)

##############################
#          g_genactual       #
##############################
source("/home/grupos/asa/2017/2.Conversores/Funciones/3. g_genactual_F.R")
anio1 = 1985
anio2 = 2017

lee_gen(dir.i , "CCEE" , anio1, anio2, dir.o) 
lee_gen(dir.i , "ENBA" , anio1, anio2, dir.o)
lee_gen(dir.i , "EUMUS", anio1, anio2, dir.o)
lee_gen(dir.i , "FCS"  , anio1, anio2, dir.o)
lee_gen(dir.i , "FDER" , anio1, anio2, dir.o)
lee_gen(dir.i , "FHUCE", anio1, anio2, dir.o)
lee_gen(dir.i , "FIC"  , anio1, anio2, dir.o)

##############################
#          g_egre_anio       #
##############################
source("/home/grupos/asa/2017/2.Conversores/Funciones/4. g_egre_anio_F.R")
anio1 = 1985
anio2 = 2016

egre(dir.i , "CCEE" , anio1, anio2, dir.o) 
egre(dir.i , "ENBA" , anio1, anio2, dir.o)
egre(dir.i , "EUMUS", anio1, anio2, dir.o)
egre(dir.i , "FCS"  , anio1, anio2, dir.o)
egre(dir.i , "FDER" , anio1, anio2, dir.o)
egre(dir.i , "FHUCE", anio1, anio2, dir.o)
egre(dir.i , "FIC"  , anio1, anio2, dir.o)

##############################
#     filtrado y pegado      #
##############################
source("/home/grupos/asa/2017/2.Conversores/Funciones/a. Filtrado y pegado actividad egreso genactual_F.R")
dir.i = "/home/grupos/asa/2017/3.Bases Convertidas/SGB/"
anio1 = 1985
anio2 = 2016
dir.o = "/home/grupos/asa/2017/4.FiltradoPegado/SGB/"

FyP(dir.i , "CCEE" , anio1, anio2, dir.o) 
FyP(dir.i , "ENBA" , anio1, anio2, dir.o)
FyP(dir.i , "EUMUS", anio1, anio2, dir.o)
FyP(dir.i , "FCS"  , anio1, anio2, dir.o)
FyP(dir.i , "FDER" , anio1, anio2, dir.o)
FyP(dir.i , "FHUCE", anio1, anio2, dir.o)
FyP(dir.i , "FIC"  , anio1, anio2, dir.o)

##############################
#         fusionadorS        #
##############################
source("/home/grupos/asa/2017/2.Conversores/Funciones/b. ejemplo script fusionador_F.R")
dir.i = "/home/grupos/asa/2017/4.FiltradoPegado/SGB/"
anio1 = 1985
anio2 = 2016
dir.o = "/home/grupos/asa/2017/5.FusionaServicios/"

FS(dir.i , "CCEE" , anio1, anio2, dir.o) 
FS(dir.i , "ENBA" , anio1, anio2, dir.o)
FS(dir.i , "EUMUS", anio1, anio2, dir.o)
FS(dir.i , "FCS"  , anio1, anio2, dir.o)
FS(dir.i , "FDER" , anio1, anio2, dir.o)
FS(dir.i , "FHUCE", anio1, anio2, dir.o)
FS(dir.i , "FIC"  , anio1, anio2, dir.o)

##############################
#         fusionadorA        #
##############################
source("/home/grupos/asa/2017/2.Conversores/Funciones/c. fusionador area_F.R")
dir.i = "/home/grupos/asa/2017/5.FusionaServicios/"

ccee  = FA(dir.i , "CCEE")
enba  = FA(dir.i , "ENBA")
eumus = FA(dir.i , "EUMUS")
fcs   = FA(dir.i , "FCS" )
fder  = FA(dir.i , "FDER")
fhuce = FA(dir.i , "FHUCE")
fic   = FA(dir.i , "FIC" )

################################
#     BASE - PANEL - ÀREA      #
################################

areasocial = rbind.data.frame(ccee,fder,fcs,fhuce,fic,enba,eumus)
areasocial = areasocial[,names(areasocial) != "X"]

save(areasocial, file = "/home/grupos/asa/2017/6.FusionaArea/Panel_areasocial_v.1.0.RData")
write.csv(areasocial,"/home/grupos/asa/2017/6.FusionaArea/Panel_areasocial_v.1.0.csv")
