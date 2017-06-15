*Ingresos al área por servicio (esto implica considerar a cada estudiante una sola vez, no importa cuantas carreras en el servicio haga)*
*por procedencia geográfica, sin contar ingresos a centros del interior*

*2010*
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2010_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop c_i cod_fac, force
gen proc_reg=.
replace proc_reg=1 if res_marzo==1
replace proc_reg=2 if res_marzo!=1 & res_marzo<=19
replace proc_reg=3 if res_marzo>19 & res_marzo!=.

tab proc_reg cod_fac if cod_fac!=13 & cod_fac!=990
*2011*
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2011_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop cedula cod_fac, force

gen proc_reg=.
replace proc_reg=1 if res_marzo==1
replace proc_reg=2 if res_marzo!=1 & res_marzo<=19
replace proc_reg=3 if res_marzo>19 & res_marzo!=.

tab proc_reg cod_fac if cod_fac!=13 & cod_fac!=990
*2012*
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2012_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values facultad facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop c_i facultad, force
*Eliminamos los estudiantes colados de carreras de posgrado*
drop if carfac==2004401

gen proc_reg=.
replace proc_reg=1 if res_marzo==1
replace proc_reg=2 if res_marzo!=1 & res_marzo<=19
replace proc_reg=3 if res_marzo>19 & res_marzo!=.

tab proc_reg facultad if facultad!=13 & facultad!=990
*2013*
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2013_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop ci cod_fac, force

gen proc_reg=.
replace proc_reg=1 if res_marzo==1
replace proc_reg=2 if res_marzo!=1 & res_marzo<=19
replace proc_reg=3 if res_marzo>19 & res_marzo!=.

tab proc_reg cod_fac if cod_fac!=13 & cod_fac!=990

*2014*
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2014, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop ci fac, force


gen proc_reg=.
replace proc_reg=1 if res_marzo==1
replace proc_reg=2 if res_marzo!=1 & res_marzo<=19
replace proc_reg=3 if res_marzo>19 & res_marzo!=.

tab proc_reg fac if fac!=13 & fac!=990 & fac!=996

****************************************************************************************************************************
*Ingresos al área por procedencia max nivel educativo del padre con mayor nivel, sin contar ingresos a centros del interior*
****************************************************************************************************************************
***********************************************************************************2010*********************************************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2010_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop c_i cod_fac, force
*pad_edu_seciu_2011 y mad_edu_seciu_2011 tienen escala LABE*
*ed_madre y ed_padre tienen escala LABD==LABE*
*ed_madre_2013 y ed_padre_2013 tienen escala LABF*
*ed_madre_2014 y ed_padre_2014 tienen escala LABG*
*no tenemos datos sobre primaria incompleta para todos, asumimos primaria incompleta=ninguna instruccion, para terc incomp tambien lo cambie*
*Use como etiquetado final el LABed de la base 2010, creado en base a la info disponible en todas las bases*
*RECODIFICACION*
replace ed_padre_2013= 1 if ed_padre_2013==2
replace ed_madre_2013= 1 if ed_madre_2013==2
replace ed_padre_2013= 2 if ed_padre_2013==3
replace ed_madre_2013= 2 if ed_madre_2013==3
replace ed_padre_2013= 3 if ed_padre_2013==4 | ed_padre_2013==8
replace ed_madre_2013= 3 if ed_madre_2013==4 | ed_madre_2013==8
replace ed_padre_2013= 4 if ed_padre_2013==5 | ed_padre_2013==9
replace ed_madre_2013= 4 if ed_madre_2013==5 | ed_madre_2013==9
replace ed_padre_2013= 5 if ed_padre_2013==6 | ed_padre_2013==10
replace ed_madre_2013= 5 if ed_madre_2013==6 | ed_madre_2013==10
replace ed_padre_2013= 6 if ed_padre_2013==7 | ed_padre_2013==11
replace ed_madre_2013= 6 if ed_madre_2013==7 | ed_madre_2013==11
replace ed_padre_2013= 7 if ed_padre_2013==12
replace ed_madre_2013= 7 if ed_madre_2013==12
replace ed_padre_2013= 8 if ed_padre_2013==13
replace ed_madre_2013= 8 if ed_madre_2013==13
replace ed_padre_2013= 99 if ed_padre_2013==99
replace ed_madre_2013= 99 if ed_madre_2013==99

replace ed_padre=3 if ed_padre==7
replace ed_madre=3 if ed_madre==7
replace ed_padre=4 if ed_padre==8
replace ed_madre=4 if ed_madre==8
replace ed_padre=5 if ed_padre==9
replace ed_madre=5 if ed_madre==9
replace ed_padre=6 if ed_padre==10 | ed_padre==13
replace ed_madre=6 if ed_madre==10 | ed_madre==13
replace ed_padre=7 if ed_padre==11
replace ed_madre=7 if ed_madre==11
replace ed_padre=8 if ed_padre==12
replace ed_madre=8 if ed_madre==12
replace ed_padre=99 if ed_padre==14
replace ed_madre=99 if ed_madre==14

replace pad_edu_papel_2011= 1 if pad_edu_papel_2011==2
replace mad_edu_papel_2011= 1 if mad_edu_papel_2011==2
replace pad_edu_papel_2011= 2 if pad_edu_papel_2011==3
replace mad_edu_papel_2011= 2 if mad_edu_papel_2011==3
replace pad_edu_papel_2011= 3 if pad_edu_papel_2011==4 | pad_edu_papel_2011==8
replace mad_edu_papel_2011= 3 if mad_edu_papel_2011==4 | mad_edu_papel_2011==8
replace pad_edu_papel_2011= 4 if pad_edu_papel_2011==5 | pad_edu_papel_2011==9
replace mad_edu_papel_2011= 4 if mad_edu_papel_2011==5 | mad_edu_papel_2011==9
replace pad_edu_papel_2011= 5 if pad_edu_papel_2011==6 | pad_edu_papel_2011==10
replace mad_edu_papel_2011= 5 if mad_edu_papel_2011==6 | mad_edu_papel_2011==10
replace pad_edu_papel_2011= 6 if pad_edu_papel_2011==7 | pad_edu_papel_2011==11
replace mad_edu_papel_2011= 6 if mad_edu_papel_2011==7 | mad_edu_papel_2011==11
replace pad_edu_papel_2011= 7 if pad_edu_papel_2011==12
replace mad_edu_papel_2011= 7 if mad_edu_papel_2011==12
replace pad_edu_papel_2011= 8 if pad_edu_papel_2011==13
replace mad_edu_papel_2011= 8 if mad_edu_papel_2011==13
replace pad_edu_papel_2011= 99 if pad_edu_papel_2011==14
replace mad_edu_papel_2011= 99 if mad_edu_papel_2011==14

replace pad_edu_papel_2012= 1 if pad_edu_papel_2012==2
replace mad_edu_papel_2012= 1 if mad_edu_papel_2012==2
replace pad_edu_papel_2012= 2 if pad_edu_papel_2012==3
replace mad_edu_papel_2012= 2 if mad_edu_papel_2012==3
replace pad_edu_papel_2012= 3 if pad_edu_papel_2012==4 | pad_edu_papel_2012==8
replace mad_edu_papel_2012= 3 if mad_edu_papel_2012==4 | mad_edu_papel_2012==8
replace pad_edu_papel_2012= 4 if pad_edu_papel_2012==5 | pad_edu_papel_2012==9
replace mad_edu_papel_2012= 4 if mad_edu_papel_2012==5 | mad_edu_papel_2012==9
replace pad_edu_papel_2012= 5 if pad_edu_papel_2012==6 | pad_edu_papel_2012==10
replace mad_edu_papel_2012= 5 if mad_edu_papel_2012==6 | mad_edu_papel_2012==10
replace pad_edu_papel_2012= 6 if pad_edu_papel_2012==7 | pad_edu_papel_2012==11
replace mad_edu_papel_2012= 6 if mad_edu_papel_2012==7 | mad_edu_papel_2012==11
replace pad_edu_papel_2012= 7 if pad_edu_papel_2012==12
replace mad_edu_papel_2012= 7 if mad_edu_papel_2012==12
replace pad_edu_papel_2012= 8 if pad_edu_papel_2012==13
replace mad_edu_papel_2012= 8 if mad_edu_papel_2012==13
replace pad_edu_papel_2012= 99 if pad_edu_papel_2012==14
replace mad_edu_papel_2012= 99 if mad_edu_papel_2012==14

replace pad_edu_seciu_2011=3 if pad_edu_seciu_2011==7
replace mad_edu_seciu_2011=3 if mad_edu_seciu_2011==7
replace pad_edu_seciu_2011=4 if pad_edu_seciu_2011==8
replace mad_edu_seciu_2011=4 if mad_edu_seciu_2011==8
replace pad_edu_seciu_2011=5 if pad_edu_seciu_2011==9
replace mad_edu_seciu_2011=5 if mad_edu_seciu_2011==9
replace pad_edu_seciu_2011=6 if pad_edu_seciu_2011==10 | pad_edu_seciu_2011==13
replace mad_edu_seciu_2011=6 if mad_edu_seciu_2011==10 | mad_edu_seciu_2011==13
replace pad_edu_seciu_2011=7 if pad_edu_seciu_2011==11
replace mad_edu_seciu_2011=7 if mad_edu_seciu_2011==11
replace pad_edu_seciu_2011=8 if pad_edu_seciu_2011==12
replace mad_edu_seciu_2011=8 if mad_edu_seciu_2011==12
replace pad_edu_seciu_2011=99 if pad_edu_seciu_2011==14
replace mad_edu_seciu_2011=99 if mad_edu_seciu_2011==14

replace pad_edu_seciu_2012=3 if pad_edu_seciu_2012==7
replace mad_edu_seciu_2012=3 if mad_edu_seciu_2012==7
replace pad_edu_seciu_2012=4 if pad_edu_seciu_2012==8
replace mad_edu_seciu_2012=4 if mad_edu_seciu_2012==8
replace pad_edu_seciu_2012=5 if pad_edu_seciu_2012==9
replace mad_edu_seciu_2012=5 if mad_edu_seciu_2012==9
replace pad_edu_seciu_2012=6 if pad_edu_seciu_2012==10 | pad_edu_seciu_2012==13
replace mad_edu_seciu_2012=6 if mad_edu_seciu_2012==10 | mad_edu_seciu_2012==13
replace pad_edu_seciu_2012=7 if pad_edu_seciu_2012==11
replace mad_edu_seciu_2012=7 if mad_edu_seciu_2012==11
replace pad_edu_seciu_2012=8 if pad_edu_seciu_2012==12
replace mad_edu_seciu_2012=8 if mad_edu_seciu_2012==12
replace pad_edu_seciu_2012=99 if pad_edu_seciu_2012==14
replace mad_edu_seciu_2012=99 if mad_edu_seciu_2012==14

replace ed_padre_2014= 1 if ed_padre_2014==2
replace ed_madre_2014= 1 if ed_madre_2014==2
replace ed_padre_2014= 2 if ed_padre_2014==3
replace ed_madre_2014= 2 if ed_madre_2014==3
replace ed_padre_2014= 3 if ed_padre_2014==4
replace ed_madre_2014= 3 if ed_madre_2014==4
replace ed_padre_2014= 4 if ed_padre_2014==5
replace ed_madre_2014= 4 if ed_madre_2014==5
replace ed_padre_2014= 5 if ed_padre_2014==10
replace ed_madre_2014= 5 if ed_madre_2014==10
replace ed_padre_2014= 6 if ed_padre_2014==11
replace ed_madre_2014= 6 if ed_madre_2014==11
replace ed_padre_2014= 7 if ed_padre_2014==12
replace ed_madre_2014= 7 if ed_madre_2014==12
replace ed_padre_2014= 8 if ed_padre_2014==13
replace ed_madre_2014= 8 if ed_madre_2014==13

*Sumamos en una variable por individuo el total de info que se tiene respecto a la educacion de sus padres*

replace ed_padre = pad_edu_papel_2011 if missing(ed_padre) 
replace ed_padre = pad_edu_seciu_2011 if missing(ed_padre) 
replace ed_padre = pad_edu_seciu_2011 if missing(ed_padre) 
replace ed_padre = pad_edu_seciu_2012 if missing(ed_padre) 
replace ed_padre = pad_edu_papel_2012 if missing(ed_padre) 
replace ed_padre = ed_padre_2013 if missing(ed_padre) 
replace ed_padre = ed_padre_2014 if missing(ed_padre) 
replace ed_madre = mad_edu_papel_2011 if missing(ed_madre) 
replace ed_madre = mad_edu_seciu_2011 if missing(ed_madre) 
replace ed_madre = mad_edu_seciu_2012  if missing(ed_madre)
replace ed_madre = mad_edu_papel_2012 if missing(ed_madre)
replace ed_madre = ed_madre_2013 if missing(ed_madre) 
replace ed_madre = ed_madre_2014 if missing(ed_madre)

egen proc_maxpedu = rowmax(ed_padre ed_madre)
label define LABed 1 "S/inst-Prim.Incomp" 2 "Prim.Comp." 3 "Ed.Media.Incp" 4 "Ed.Media.Cmpl" 5 "Terc.No.Univ.Incmp" 6 "Terc.No.Univ.Cmpl" 7 "Univ.Incmpl" 8 "Univ.Cmpl" 99 "Residual"
label values proc_maxpedu LABed

*EDAD*
nsplit fecha_nac, digits (4)
rename fecha_nac1 año_nac
gen edad = 2011 - año_nac
replace edad=. if edad==0
*Re-etiquetamos las carreras, OJO:se etiquetan por igual sin importar la localizacion del centro donde se dicta la carrera*
gen idcarr=.
replace idcarr=30070 if carrfac==3007000 | carrfac==3007002 | carrfac==3007004 | carrfac==3007003 | carrfac==3007020
replace idcarr=30071 if carrfac==3007100 | carrfac==3007105 | carrfac==3007106 | carrfac==3007108 | carrfac==3007109 | carrfac==3007110 | carrfac==3007111 | carrfac==3007112 | carrfac==3007113 | carrfac==3007114 | carrfac==300716 | carrfac==3007117 | carrfac==3007118 | carrfac==3007119
replace idcarr=121   if carrfac==120109
replace idcarr=51   if carrfac==50101 | carrfac==50195
replace idcarr=162   if carrfac==160202
replace idcarr=122   if carrfac==120209
replace idcarr=6002   if carrfac==6000201 | carrfac==40201
replace idcarr=5002   if carrfac==5000102 | carrfac==5000105 | carrfac==5000201 | carrfac==5000300 | carrfac==5000304 | carrfac==5001101
replace idcarr=43 if carrfac==40301 | carrfac==40302 | carrfac==40303
replace idcarr=123 if carrfac==120302 | carrfac==120303 | carrfac==120309 | carrfac==120400
replace idcarr=41 if carrfac==40401
replace idcarr=44 if carrfac==40402
replace idcarr=45 if carrfac==40404 | carrfac==40405
replace idcarr=49 if carrfac==40409
replace idcarr=124 if carrfac==120402 | carrfac==120403 | carrfac==120409
replace idcarr=125 if carrfac==120500 | carrfac==120502 | carrfac==120503 | carrfac==120509
replace idcarr=126 if carrfac==120600 | carrfac==120602 | carrfac==120603 | carrfac==120609 | carrfac==120631
replace idcarr=127 if carrfac==120701 | carrfac==127101
replace idcarr=238 if carrfac==230801 | carrfac==230081
replace idcarr=129 if carrfac==120901
replace idcarr=2001 if carrfac==2001101 | carrfac==2002101 | carrfac==2002201
replace idcarr=2003 if carrfac==2003101 | carrfac==2003301
replace idcarr=55 if carrfac==55001 | carrfac==55101 | carrfac==55201 | carrfac==55301 | carrfac==55401
replace idcarr=58 if carrfac==55701 | carrfac==58001 | carrfac==58401 | carrfac==58901 | carrfac==58995 | carrfac==50100 | carrfac==50501 | carrfac==57001
replace idcarr=59 if carrfac==50200 | carrfac==50601 | carrfac==57002 | carrfac==55801 | carrfac==58501 | carrfac==59001 | carrfac==59095
replace idcarr=52 if carrfac==59501 | carrfac==59595 | carrfac==59101

label define idcarr 30070 "Lic. en Música"
label define idcarr 30071 "Lic. en Interpretacion", add
label define idcarr 121 "Antropología", add
label define idcarr 51 "Rel. Int.", add
label define idcarr 162 "Lic. en Artes", add
label define idcarr 122 "CC de la Educ.", add
label define idcarr 6002 "TUA", add
label define idcarr 5002 "Lic. en Comunicación", add
label define idcarr 43 "Lic. en Estadística", add
label define idcarr 123 "Lic. en Historia", add
label define idcarr 41 "Contador Publico", add
label define idcarr 44 "Lic. en Economía", add
label define idcarr 45 "Lic. en Administración", add
label define idcarr 49 "FCEA-Basico", add
label define idcarr 124 "Lic. en Filosofía", add
label define idcarr 125 "Lic. en Letras", add
label define idcarr 126 "Lic. en linguistica", add
label define idcarr 127 "Téc. Turismo", add
label define idcarr 238 "CI-FCS", add
label define idcarr 129 "Tec.Corr.Estilo", add
label define idcarr 2001 "Lic. en Bibliotecología", add
label define idcarr 2003 "Lic. en Archivología", add
label define idcarr 55 "Traductorado Publico", add
label define idcarr 58 "Abogacía", add
label define idcarr 59 "Notariado", add
label define idcarr 52 "Rel. Laborales", add
label values idcarr idcarr

*Identificamos al Interior*
gen car_int=.
replace car_int=2 if carrfac==120701 | carrfac==127101

label define car_int 1 "RN"
label define car_int 2 "CURE", add
label values car_int car_int
*Asignamos las carreras del interior a una Facultad*
replace cod_fac=12 if carrfac==120701 | carrfac==127101

***********************************************************************************2011*********************************************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2011_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop cedula cod_fac, force
*no comparte las mismas variables que la 2010, pero si se puede recodificar de todas formas con nuestra metodologia*
*no tenemos datos sobre primaria incompleta para todos, asumimos primaria incompleta=ninguna instruccion, para terc incomp tambien lo cambie*
*Use como etiquetado final el LABed de la base 2010, creado en base a la info disponible en todas las bases*
*RECODIFICACION*
replace pad_edu_papel= 1 if pad_edu_papel==2
replace mad_edu_papel= 1 if mad_edu_papel==2
replace pad_edu_papel= 2 if pad_edu_papel==3
replace mad_edu_papel= 2 if mad_edu_papel==3
replace pad_edu_papel= 3 if pad_edu_papel==4 | pad_edu_papel==8
replace mad_edu_papel= 3 if mad_edu_papel==4 | mad_edu_papel==8
replace pad_edu_papel= 4 if pad_edu_papel==5 | pad_edu_papel==9
replace mad_edu_papel= 4 if mad_edu_papel==5 | mad_edu_papel==9
replace pad_edu_papel= 5 if pad_edu_papel==6 | pad_edu_papel==10
replace mad_edu_papel= 5 if mad_edu_papel==6 | mad_edu_papel==10
replace pad_edu_papel= 6 if pad_edu_papel==7 | pad_edu_papel==11
replace mad_edu_papel= 6 if mad_edu_papel==7 | mad_edu_papel==11
replace pad_edu_papel= 7 if pad_edu_papel==12
replace mad_edu_papel= 7 if mad_edu_papel==12
replace pad_edu_papel= 8 if pad_edu_papel==13
replace mad_edu_papel= 8 if mad_edu_papel==13
replace pad_edu_papel= 99 if pad_edu_papel==14
replace mad_edu_papel= 99 if mad_edu_papel==14

replace pad_edu_seciu=3 if pad_edu_seciu==7
replace mad_edu_seciu=3 if mad_edu_seciu==7
replace pad_edu_seciu=4 if pad_edu_seciu==8
replace mad_edu_seciu=4 if mad_edu_seciu==8
replace pad_edu_seciu=5 if pad_edu_seciu==9
replace mad_edu_seciu=5 if mad_edu_seciu==9
replace pad_edu_seciu=6 if pad_edu_seciu==10 | pad_edu_seciu==13
replace mad_edu_seciu=6 if mad_edu_seciu==10 | mad_edu_seciu==13
replace pad_edu_seciu=7 if pad_edu_seciu==11
replace mad_edu_seciu=7 if mad_edu_seciu==11
replace pad_edu_seciu=8 if pad_edu_seciu==12
replace mad_edu_seciu=8 if mad_edu_seciu==12
replace pad_edu_seciu=99 if pad_edu_seciu==14
replace mad_edu_seciu=99 if mad_edu_seciu==14


*Sumamos en una variable por individuo el total de info que se tiene respecto a la educacion de sus padres*

replace pad_edu_papel = pad_edu_seciu if missing(pad_edu_papel) 
replace mad_edu_papel = mad_edu_seciu if missing(mad_edu_papel)
rename pad_edu_papel ed_padre
rename mad_edu_papel ed_madre
egen proc_maxpedu = rowmax(ed_padre ed_madre)
label define LABed 1 "S/inst-Prim.Incomp" 2 "Prim.Comp." 3 "Ed.Media.Incp" 4 "Ed.Media.Cmpl" 5 "Terc.No.Univ.Incmp" 6 "Terc.No.Univ.Cmpl" 7 "Univ.Incmpl" 8 "Univ.Cmpl" 99 "Residual"
label values proc_maxpedu LABed

*EDAD*
nsplit fecha_nac, digits (4)
rename fecha_nac1 año_nac
gen edad = 2011 - año_nac
replace edad=. if edad==0
*Re-etiquetamos las carreras, OJO:se etiquetan por igual sin importar la localizacion del centro donde se dicta la carrera*
gen idcarr=.
replace idcarr=30070 if carrfac==30007000 | carrfac==30007002 | carrfac==30007004 | carrfac==30007003 | carrfac==30007020 | carrfac==30006900 | carrfac==30006902 | carrfac==30006903 | carrfac==30006904 | carrfac==30006905 | carrfac==30006906 | carrfac==30006907 | carrfac==30006908 | carrfac==30006909 | carrfac==30006910 | carrfac==30006911 | carrfac==30006912 | carrfac==30006913 | carrfac==30006914 | carrfac==30006915 | carrfac==30006916 | carrfac==30006917 | carrfac==30006918 | carrfac==30006919 | carrfac==30006920
replace idcarr=30071 if carrfac==30007100 | carrfac==30007105 | carrfac==30007106 | carrfac==30007107 | carrfac==30007108 | carrfac==30007109 | carrfac==30007110 | carrfac==30007111 | carrfac==30007112 | carrfac==30007113 | carrfac==30007114 | carrfac==30007115 |carrfac==3000716 | carrfac==30007117 | carrfac==30007118 | carrfac==30007119 | carrfac==30007120 | carrfac==30007121
replace idcarr=121   if carrfac==1200109 | carrfac==1200102 | carrfac==1200103
replace idcarr=51   if carrfac==500101 | carrfac==500201 | carrfac==501801
replace idcarr=42 if carrfac==401500 | carrfac==401510
replace idcarr=162   if carrfac==1600202 | carrfac==1600203 | carrfac==1600204 | carrfac==1600205 | carrfac==1600206 | carrfac==1600207 | carrfac==1600208 | carrfac==1600302 | carrfac==1600303 | carrfac==1600802 | carrfac==1600808
replace idcarr=122   if carrfac==1200209 | carrfac==1209101 | carrfac==1200203 | carrfac==1200202 | carrfac==1202201 | carrfac==1202101
replace idcarr=6002   if carrfac==60000201 | carrfac==60000101 | carrfac==60000102 | carrfac==60002201 | carrfac==60002400 | carrfac==60004401
replace idcarr=5002   if carrfac==50000101 | carrfac==50000102 | carrfac==50000103 | carrfac==50000105 | carrfac==50000201 | carrfac==50000300 | carrfac==50000301 | carrfac==50000302 | carrfac==50000305 | carrfac==50000306 | carrfac==50000401 | carrfac==50000501
replace idcarr=43 if carrfac==400301 | carrfac==400302 | carrfac==400303
replace idcarr=123 if carrfac==1200302 | carrfac==1200303 | carrfac==1200309
replace idcarr=41 if carrfac==400401 | carrfac==400704 | carrfac==401100
replace idcarr=44 if carrfac==400402 | carrfac==400605 | carrfac==400702 | carrfac==401200
replace idcarr=45 if carrfac==400404 | carrfac==400405 | carrfac==401400
replace idcarr=49 if carrfac==404910 | carrfac==400409 | carrfac==400109
replace idcarr=124 if carrfac==1200402 | carrfac==1200403 | carrfac==1200409 | carrfac==1204701 | carrfac==1204401 | carrfac==1204301 | carrfac==1204201 | carrfac==1204101 | carrfac==1204701
replace idcarr=125 if carrfac==1200509 | carrfac==1200502 | carrfac==1200503 | carrfac==1205101 | carrfac==1205102 | carrfac==1205103 | carrfac==1205104 | carrfac==1205106 | carrfac==1205107 | carrfac==1205109 | carrfac==1205201 | carrfac==1205301 | carrfac==1209301
replace idcarr=126 if carrfac==1200602 | carrfac==1200603 | carrfac==1200609 | carrfac==1200631 | carrfac==1206102 | carrfac==1206103 | carrfac==1206104 | carrfac==1206109 | carrfac==1206201 | carrfac==1209401
replace idcarr=127 if carrfac==120701 | carrfac==127101
replace idcarr=238 if carrfac==230801 | carrfac==2300801 | carrfac==2300901 | carrfac==2390101
replace idcarr=129 if carrfac==1200901
replace idcarr=2001 if carrfac==20000201 | carrfac==20001101 | carrfac==20002101 | carrfac==20002201 | carrfac==20006601
replace idcarr=2003 if carrfac==20000101 | carrfac==20003101 | carrfac==20003201 | carrfac==20005501 | carrfac==20003301
replace idcarr=55 if carrfac==505001 | carrfac==505101 | carrfac==505201 | carrfac==505301 | carrfac==505401
replace idcarr=58 if carrfac==505701 | carrfac==508001 | carrfac==508401 | carrfac==508901 | carrfac==508995 | carrfac==504201 | carrfac==50100 | carrfac==500501 | carrfac==507001
replace idcarr=59 if carrfac==50200 | carrfac==500601 | carrfac==57002 | carrfac==505801 | carrfac==508501 | carrfac==509001 | carrfac==509095 | carrfac==508101 | carrfac==507002
replace idcarr=52 if carrfac==509501 | carrfac==59595 | carrfac==59101 | carrfac==501201 | carrfac==501301
replace idcarr=239 if carrfac==1300201 | carrfac==1300202 | carrfac==2301004 | carrfac==2300301 | carrfac==2300302 | carrfac==2300401
replace idcarr=3001 if carrfac==3000101 | carrfac==3000102 | carrfac==3000103 | carrfac==3000104 | carrfac==3001100
replace idcarr=161 if carrfac==1601212
replace idcarr=3002 if carrfac==30001400
replace idcarr=1215 if carrfac==1201501
replace idcarr=1216 if carrfac==1201601 | carrfac==1201603 | carrfac==1201604 | carrfac==1201605 | carrfac==1201606 | carrfac==1201607
replace idcarr=1271 if carrfac==127110 | carrfac==1201301 | carrfac==1201401 | carrfac==1207101 | carrfac==1207110

label define idcarr 30070 "Lic. en Música"
label define idcarr 30071 "Lic. en Interpretacion", add
label define idcarr 121 "Antropología", add
label define idcarr 51 "Rel. Int.", add
label define idcarr 42 "TAC", add
label define idcarr 162 "Lic. en Artes", add
label define idcarr 122 "CC de la Educ.", add
label define idcarr 6002 "TUA", add
label define idcarr 5002 "Lic. en Comunicación", add
label define idcarr 43 "Lic. en Estadística", add
label define idcarr 123 "Lic. en Historia", add
label define idcarr 41 "Contador Publico", add
label define idcarr 44 "Lic. en Economía", add
label define idcarr 45 "Lic. en Administración", add
label define idcarr 49 "FCEA-Basico", add
label define idcarr 124 "Lic. en Filosofía", add
label define idcarr 125 "Lic. en Letras", add
label define idcarr 126 "Lic. en linguistica", add
label define idcarr 127 "Téc. Turismo", add
label define idcarr 238 "CI-FCS", add
label define idcarr 129 "Tec.Corr.Estilo", add
label define idcarr 2001 "Lic. en Bibliotecología", add
label define idcarr 2003 "Lic. en Archivología", add
label define idcarr 55 "Traductorado Publico", add
label define idcarr 58 "Abogacía", add
label define idcarr 59 "Notariado", add
label define idcarr 52 "Rel. Laborales", add
label define idcarr 239 "Trabajo Social", add
label define idcarr 3001 "Dip. en Música", add
label define idcarr 161 "Lic. LyM Audiovis.", add
label define idcarr 3002 "Tec. en Int. Musical", add
label define idcarr 1215 "Tec.Univ.Int.L. de Señas", add
label define idcarr 1216 "Lic. en Museología", add
label define idcarr 1271 "Lic. en Turismo", add
label values idcarr idcarr

*Identificamos al Interior, por cenur*
gen car_int=.
replace car_int=1 if carrfac==2300901 | carrfac==508995 | carrfac==509095 | carrfac==2301004 | idcarr==3002 | carrfac==30001100
replace car_int=2 if idcarr==1271 | idcarr==161

label define car_int 1 "RN"
label define car_int 2 "CURE", add
label values car_int car_int
*Asignamos las carreras del interior a una Facultad*
replace cod_fac=23 if carrfac==2300901
replace cod_fac=5 if carrfac==508995 | carrfac==509095 | carrfac==2301004 
replace cod_fac=12 if carrfac==1271
replace cod_fac=16 if carrfac==161
replace cod_fac=300 if idcarr==3002 | carrfac==30001100
***********************************************************************************2012*********************************************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2012_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values facultad facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop c_i facultad, force
*Eliminamos los estudiantes colados de carreras de posgrado*
drop if carfac==2004401
*pad_edu_seciu_2011 y mad_edu_seciu_2011 tienen escala LABE*
*ed_madre y ed_padre tienen escala LABD==LABE*
*ed_madre_2013 y ed_padre_2013 tienen escala LABF*
*ed_madre_2014 y ed_padre_2014 tienen escala LABG*
*no tenemos datos sobre primaria incompleta para todos, asumimos primaria incompleta=ninguna instruccion, para terc incomp tambien lo cambie*
*Use como etiquetado final el LABed de la base 2010, creado en base a la info disponible en todas las bases*
*RECODIFICACION*
replace pad_edu_papel= 1 if pad_edu_papel==2
replace mad_edu_papel= 1 if mad_edu_papel==2
replace pad_edu_papel= 2 if pad_edu_papel==3
replace mad_edu_papel= 2 if mad_edu_papel==3
replace pad_edu_papel= 3 if pad_edu_papel==4 | pad_edu_papel==8
replace mad_edu_papel= 3 if mad_edu_papel==4 | mad_edu_papel==8
replace pad_edu_papel= 4 if pad_edu_papel==5 | pad_edu_papel==9
replace mad_edu_papel= 4 if mad_edu_papel==5 | mad_edu_papel==9
replace pad_edu_papel= 5 if pad_edu_papel==6 | pad_edu_papel==10
replace mad_edu_papel= 5 if mad_edu_papel==6 | mad_edu_papel==10
replace pad_edu_papel= 6 if pad_edu_papel==7 | pad_edu_papel==11
replace mad_edu_papel= 6 if mad_edu_papel==7 | mad_edu_papel==11
replace pad_edu_papel= 7 if pad_edu_papel==12
replace mad_edu_papel= 7 if mad_edu_papel==12
replace pad_edu_papel= 8 if pad_edu_papel==13
replace mad_edu_papel= 8 if mad_edu_papel==13
replace pad_edu_papel= 99 if pad_edu_papel==14
replace mad_edu_papel= 99 if mad_edu_papel==14

replace pad_edu_seciu=3 if pad_edu_seciu==7
replace mad_edu_seciu=3 if mad_edu_seciu==7
replace pad_edu_seciu=4 if pad_edu_seciu==8
replace mad_edu_seciu=4 if mad_edu_seciu==8
replace pad_edu_seciu=5 if pad_edu_seciu==9
replace mad_edu_seciu=5 if mad_edu_seciu==9
replace pad_edu_seciu=6 if pad_edu_seciu==10 | pad_edu_seciu==13
replace mad_edu_seciu=6 if mad_edu_seciu==10 | mad_edu_seciu==13
replace pad_edu_seciu=7 if pad_edu_seciu==11
replace mad_edu_seciu=7 if mad_edu_seciu==11
replace pad_edu_seciu=8 if pad_edu_seciu==12
replace mad_edu_seciu=8 if mad_edu_seciu==12
replace pad_edu_seciu=99 if pad_edu_seciu==14
replace mad_edu_seciu=99 if mad_edu_seciu==14

replace pad_edu_2014= 1 if pad_edu_2014==2
replace mad_edu_2014= 1 if mad_edu_2014==2
replace pad_edu_2014= 2 if pad_edu_2014==3
replace mad_edu_2014= 2 if mad_edu_2014==3
replace pad_edu_2014= 3 if pad_edu_2014==4
replace mad_edu_2014= 3 if mad_edu_2014==4
replace pad_edu_2014= 4 if pad_edu_2014==5
replace mad_edu_2014= 4 if mad_edu_2014==5
replace pad_edu_2014= 5 if pad_edu_2014==10
replace mad_edu_2014= 5 if mad_edu_2014==10
replace pad_edu_2014= 6 if pad_edu_2014==11
replace mad_edu_2014= 6 if mad_edu_2014==11
replace pad_edu_2014= 7 if pad_edu_2014==12
replace mad_edu_2014= 7 if mad_edu_2014==12
replace pad_edu_2014= 8 if pad_edu_2014==13
replace mad_edu_2014= 8 if mad_edu_2014==13

*Sumamos en una variable por individuo el total de info que se tiene respecto a la educacion de sus padres*

replace pad_edu_papel = pad_edu_seciu if missing(pad_edu_papel) 
replace pad_edu_papel = pad_edu_2014 if missing(pad_edu_papel) 
replace mad_edu_papel = mad_edu_seciu if missing(mad_edu_papel) 
replace mad_edu_papel = mad_edu_2014 if missing(mad_edu_papel) 
rename mad_edu_papel ed_madre
rename pad_edu_papel ed_padre
egen proc_maxpedu = rowmax(ed_padre ed_madre)
label define LABed 1 "S/inst-Prim.Incomp" 2 "Prim.Comp." 3 "Ed.Media.Incp" 4 "Ed.Media.Cmpl" 5 "Terc.No.Univ.Incmp" 6 "Terc.No.Univ.Cmpl" 7 "Univ.Incmpl" 8 "Univ.Cmpl" 99 "Residual"
label values proc_maxpedu LABed
*La gente que no aparece es porque no contesto ninguna de las preguntas respecto a educ. de los padres*

*EDAD*
nsplit fecha_nac, digits (4)
rename fecha_nac1 año_nac
gen edad = 2012 - año_nac
replace edad=. if edad==0
*Re-etiquetamos las carreras, OJO:se etiquetan por igual sin importar la localizacion del centro donde se dicta la carrera*
gen idcarr=.
replace idcarr=30070 if carfac==3007000 | carfac==3007002 | carfac==3007004 | carfac==3007003 | carfac==3007020
replace idcarr=30071 if carfac==3007100 | carfac==3007105 | carfac==3007106 | carfac==3007108 | carfac==3007109 | carfac==3007110 | carfac==3007111 | carfac==3007112 | carfac==3007113 | carfac==3007114 | carfac==300716 | carfac==3007117 | carfac==3007118 | carfac==3007119
replace idcarr=121   if carfac==120109 | carfac==120102 | carfac==120103 | carfac==120109 | carfac==120100
replace idcarr=51   if carfac==50101 | carfac==50195
replace idcarr=42 if carfac==40201 | carfac==41500 | carfac==6002201 | carfac==6004401 | carfac==41510
replace idcarr=162   if carfac==160202
replace idcarr=122   if carfac==120209
replace idcarr=6002   if carfac==6000201 | carfac==400201
replace idcarr=5002   if carfac==5000102 | carfac==5000105 | carfac==5000201 | carfac==5000300 | carfac==5000304 | carfac==5001101 | carfac==5000401
replace idcarr=43 if carfac==40301 | carfac==40302 | carfac==40303
replace idcarr=123 if carfac==120302 | carfac==120303 | carfac==120309 | carfac==120400
replace idcarr=41 if carfac==40401 | carfac==41100
replace idcarr=44 if carfac==40402 | carfac==41200
replace idcarr=45 if carfac==40404 | carfac==40405 | carfac==41400
replace idcarr=49 if carfac==40409
replace idcarr=124 if carfac==120402 | carfac==120403 | carfac==120409 | carfac==124701
replace idcarr=125 if carfac==120500 | carfac==120502 | carfac==120503 | carfac==120509
replace idcarr=126 if carfac==120600 | carfac==120602 | carfac==120603 | carfac==120609 | carfac==120631
replace idcarr=127 if carfac==120701 | carfac==127101
replace idcarr=238 if carfac==230801 | carfac==230081 | carfac==130101 | carfac==230801
replace idcarr=129 if carfac==120901
replace idcarr=2001 if carfac==2001101 | carfac==2002101 | carfac==2002201 | carfac==2006601
replace idcarr=2003 if carfac==2003101 | carfac==2003301 | carfac==2005501
replace idcarr=55 if carfac==55001 | carfac==55101 | carfac==55201 | carfac==55301 | carfac==55401
replace idcarr=58 if carfac==55701 | carfac==58001 | carfac==58401 | carfac==58901 | carfac==58995 | carfac==50100 | carfac==50501 | carfac==57001 | carfac==138901
replace idcarr=59 if carfac==50200 | carfac==50601 | carfac==57002 | carfac==55801 | carfac==58501 | carfac==59001 | carfac==59095 | carfac==139001
replace idcarr=52 if carfac==59501 | carfac==59595 | carfac==59101 | carfac==51201
replace idcarr=12711 if carfac==131301 | carfac==121700
replace idcarr=1271 if carfac==127110 | carfac==126395
replace idcarr=12712 if carfac==131401
replace idcarr=132 if carfac==132701 | carfac==132801 | carfac==3001400
replace idcarr=133 if carfac==133001 | carfac==3001500
replace idcarr=161 if carfac==161200
replace idcarr=1611 if carfac==161010

label define idcarr 30070 "Lic. en Música"
label define idcarr 30071 "Lic. en Interpretacion", add
label define idcarr 121 "Antropología", add
label define idcarr 51 "Rel. Int.", add
label define idcarr 42 "TAC", add
label define idcarr 162 "Lic. en Artes", add
label define idcarr 122 "CC de la Educ.", add
label define idcarr 6002 "TUA", add
label define idcarr 5002 "Lic. en Comunicación", add
label define idcarr 43 "Lic. en Estadística", add
label define idcarr 123 "Lic. en Historia", add
label define idcarr 41 "Contador Publico", add
label define idcarr 44 "Lic. en Economía", add
label define idcarr 45 "Lic. en Administración", add
label define idcarr 49 "FCEA-Basico", add
label define idcarr 124 "Lic. en Filosofía", add
label define idcarr 125 "Lic. en Letras", add
label define idcarr 126 "Lic. en linguistica", add
label define idcarr 127 "Téc. Turismo", add
label define idcarr 238 "CI-FCS", add
label define idcarr 129 "Tec.Corr.Estilo", add
label define idcarr 2001 "Lic. en Bibliotecología", add
label define idcarr 2003 "Lic. en Archivología", add
label define idcarr 55 "Traductorado Publico", add
label define idcarr 58 "Abogacía", add
label define idcarr 59 "Notariado", add
label define idcarr 52 "Rel. Laborales", add
label define idcarr 12711 "Lic. Binac. en Turismo", add
label define idcarr 1271 "Lic. en Turismo", add
label define idcarr 12712 "Tec. Binac. en Turismo", add
label define idcarr 132 "Tec. en Interpretación", add
label define idcarr 133 "Tec. Dirección Coros", add
label define idcarr 161 "Lic. LyM Audiovis.", add
label define idcarr 1611 "Tec. Imagen Fotog.", add
label values idcarr idcarr

*Eliminamos los estudiantes colados de carreras de posgrado*
drop if carfac==2004401

*Identificamos al Interior, por cenur*
gen car_int=.
replace car_int=1 if carfac==58995 | carfac==59095 | carfac==121700 | carfac==130101 | carfac==131301 | carfac==131401 | carfac==132701 | carfac==132801 | carfac==133001 | carfac==138901 | carfac==139001 | carfac==3001400
replace car_int=2 if carfac==41510 | carfac==127110 | idcarr==161
replace car_int=3 if carfac==41500
replace car_int=4 if idcarr==1611

label define car_int 1 "RN"
label define car_int 2 "CURE", add
label define car_int 3 "CUT", add
label define car_int 4 "CUP", add
label values car_int car_int
*Asignamos las carreras del interior a una Facultad*
replace facultad=4 if carfac==41510 | carfac==41500
replace facultad=300 if  carfac==132701  | carfac==132801 | carfac==133001 | carfac==3001400 
replace facultad=23 if carfac==130101
replace facultad=12 if  carfac==121700 | carfac==131301 | carfac==131401 | carfac==127110
replace facultad=5 if carfac==58995 | carfac==59095 | carfac==138901 | carfac==139001
replace facultad=16 if idcarr==161 | carfac==1611
***********************************************************************************2013*********************************************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2013_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop ci cod_fac, force
*pad_edu_seciu_2011 y mad_edu_seciu_2011 tienen escala LABE*
*ed_madre y ed_padre tienen escala LABD==LABE*
*ed_madre_2013 y ed_padre_2013 tienen escala LABF*
*ed_madre_2014 y ed_padre_2014 tienen escala LABG*
*no tenemos datos sobre primaria incompleta para todos, asumimos primaria incompleta=ninguna instruccion, para terc incomp tambien lo cambie*
*Use como etiquetado final el LABM de la base 2010, creado en base a la info disponible en todas las bases*
*RECODIFICACION*
replace ed_padre= 1 if ed_padre==2
replace ed_madre= 1 if ed_madre==2
replace ed_padre= 2 if ed_padre==3
replace ed_madre= 2 if ed_madre==3
replace ed_padre= 3 if ed_padre==4 | ed_padre==8
replace ed_madre= 3 if ed_madre==4 | ed_madre==8
replace ed_padre= 4 if ed_padre==5 | ed_padre==9
replace ed_madre= 4 if ed_madre==5 | ed_madre==9
replace ed_padre= 5 if ed_padre==6 | ed_padre==10
replace ed_madre= 5 if ed_madre==6 | ed_madre==10
replace ed_padre= 6 if ed_padre==7 | ed_padre==11
replace ed_madre= 6 if ed_madre==7 | ed_madre==11
replace ed_padre= 7 if ed_padre==12
replace ed_madre= 7 if ed_madre==12
replace ed_padre= 8 if ed_padre==13
replace ed_madre= 8 if ed_madre==13
replace ed_padre= 99 if ed_padre==99
replace ed_madre= 99 if ed_madre==99

egen proc_maxpedu = rowmax(ed_padre ed_madre)
label define LABed 1 "S/inst-Prim.Incomp" 2 "Prim.Comp." 3 "Ed.Media.Incp" 4 "Ed.Media.Cmpl" 5 "Terc.No.Univ.Incmp" 6 "Terc.No.Univ.Cmpl" 7 "Univ.Incmpl" 8 "Univ.Cmpl" 99 "Residual"
label values proc_maxpedu LABed
*EDAD*
nsplit fecha_nac, digits (4)
rename fecha_nac1 año_nac
gen edad = 2013 - año_nac
replace edad=. if edad==0
*Re-etiquetamos las carreras, OJO:se etiquetan por igual sin importar la localizacion del centro donde se dicta la carrera*
gen idcarr=.
*19 obs. clasificadas como maestría en economía, 1 obs. como  400900, 1 obs. como módulo prob. y des. econ., 2 obs. como  maestrÍa en inf y com, 
replace idcarr=30070 if carrfac==30007000 | carrfac==30007002 | carrfac==30007004 | carrfac==30007003 | carrfac==30007020 | carrfac==30006900 | carrfac==30006902 | carrfac==30006903 | carrfac==30006904 | carrfac==30006905 | carrfac==30006906 | carrfac==30006907 | carrfac==30006908 | carrfac==30006909 | carrfac==30006910 | carrfac==30006911 | carrfac==30006912 | carrfac==30006913 | carrfac==30006914 | carrfac==30006915 | carrfac==30006916 | carrfac==30006917 | carrfac==30006918 | carrfac==30006919 | carrfac==30006920
replace idcarr=30071 if carrfac==30007100 | carrfac==30007105 | carrfac==30007106 | carrfac==30007107 | carrfac==30007108 | carrfac==30007109 | carrfac==30007110 | carrfac==30007111 | carrfac==30007112 | carrfac==30007113 | carrfac==30007114 | carrfac==30007115 |carrfac==30007116 | carrfac==30007117 | carrfac==30007118 | carrfac==30007119 | carrfac==30007120 | carrfac==30007121 | carrfac==30007106
replace idcarr=121   if carrfac==1200109 | carrfac==1200102 | carrfac==1200103
replace idcarr=51   if carrfac==500101 | carrfac==500201 | carrfac==501801
replace idcarr=42 if carrfac==401500 | carrfac==401510 | carrfac==99005501 | carrfac==99005401 | carrfac==99005601
replace idcarr=162   if carrfac==1600202 | carrfac==1600203 | carrfac==1600204 | carrfac==1600205 | carrfac==1600206 | carrfac==1600207 | carrfac==1600208 | carrfac==1600302 | carrfac==1600303 | carrfac==1600802 | carrfac==1600808
replace idcarr=165 if carrfac==99001001 
replace idcarr=166 if carrfac==1601010
replace idcarr=122   if carrfac==1200209 | carrfac==1209101 | carrfac==1200203 | carrfac==1200202 | carrfac==1202201 | carrfac==1202101
replace idcarr=6002   if carrfac==60000201 | carrfac==60000101 | carrfac==60000102 | carrfac==60002201 | carrfac==60002400 | carrfac==60004401
replace idcarr=5002   if carrfac==50000101 | carrfac==50000102 | carrfac==50000103 | carrfac==50000105 | carrfac==50000201 | carrfac==50000300 | carrfac==50000301 | carrfac==50000302 | carrfac==50000305 | carrfac==50000306 | carrfac==50000401 | carrfac==50000501
replace idcarr=43 if carrfac==400301 | carrfac==400302 | carrfac==400303
replace idcarr=123 if carrfac==1200302 | carrfac==1200303 | carrfac==1200309
replace idcarr=41 if carrfac==400401 | carrfac==400704 | carrfac==401100 |carrfac == 401000
replace idcarr=44 if carrfac==400402 | carrfac==400605 | carrfac==400702 | carrfac==401200
replace idcarr=45 if carrfac==400404 | carrfac==400405 | carrfac==401400
replace idcarr=49 if carrfac==404910 | carrfac==400409 | carrfac==400109
replace idcarr=124 if carrfac==1200402 | carrfac==1200403 | carrfac==1200409 | carrfac==1204701 | carrfac==1204401 | carrfac==1204301 | carrfac==1204201 | carrfac==1204101 | carrfac==1204701
replace idcarr=125 if carrfac==1200509 | carrfac==1200502 | carrfac==1200503 | carrfac==1205101 | carrfac==1205102 | carrfac==1205103 | carrfac==1205104 | carrfac==1205106 | carrfac==1205107 | carrfac==1205109 | carrfac==1205201 | carrfac==1205301 | carrfac==1209301
replace idcarr=126 if carrfac==1200602 | carrfac==1200603 | carrfac==1200609 | carrfac==1200631 | carrfac==1206102 | carrfac==1206103 | carrfac==1206104 | carrfac==1206109 | carrfac==1206201 | carrfac==1209401
replace idcarr=127 if carrfac==120701 | carrfac==127101
replace idcarr=238 if carrfac==230801 | carrfac==2300801 | carrfac==2300901 | carrfac==2390101 | carrfac==1300101
replace idcarr=129 if carrfac==1200901
replace idcarr=2001 if carrfac==20000201 | carrfac==20001101 | carrfac==20002101 | carrfac==20002201 | carrfac==20006601
replace idcarr=2003 if carrfac==20000101 | carrfac==20003101 | carrfac==20003201 | carrfac==20005501 | carrfac==20003301
replace idcarr=55 if carrfac==505001 | carrfac==505101 | carrfac==505201 | carrfac==505301 | carrfac==505401
replace idcarr=58 if carrfac==505701 | carrfac==508001 | carrfac==508401 | carrfac==508901 | carrfac==508995 | carrfac==504201 | carrfac==50100 | carrfac==500501 | carrfac==507001 | carrfac==1308901
replace idcarr=59 if carrfac==50200 | carrfac==500601 | carrfac==57002 | carrfac==505801 | carrfac==508501 | carrfac==509001 | carrfac==509095 | carrfac==508101 | carrfac==507002 | carrfac==1309001
replace idcarr=52 if carrfac==509501 | carrfac==59595 | carrfac==59101 | carrfac==501201 | carrfac==501301
replace idcarr=239 if carrfac==1300201 | carrfac==1300202 | carrfac==2301004 | carrfac==2300301 | carrfac==2300302 | carrfac==2300401
replace idcarr=3001 if carrfac==3000101 | carrfac==3000102 | carrfac==3000103 | carrfac==3000104 | carrfac==3001100
replace idcarr=161 if carrfac==1601212 |  carrfac== 99001212
replace idcarr=3002 if carrfac==30001400 |  carrfac== 1302701 |  carrfac== 1302801 |  carrfac== 1302901 |  carrfac== 1303001
replace idcarr=1215 if carrfac==1201501
replace idcarr=1216 if carrfac==1201601 | carrfac==1201603 | carrfac==1201604 | carrfac==1201605 | carrfac==1201606 | carrfac==1201607
replace idcarr=1271 if carrfac==127110 | carrfac==1201301 | carrfac==1201401 | carrfac==1207101 | carrfac==1207110

label define idcarr 30070 "Lic. en Música"
label define idcarr 30071 "Lic. en Interpretacion", add
label define idcarr 121 "Antropología", add
label define idcarr 51 "Rel. Int.", add
label define idcarr 42 "TAC", add
label define idcarr 162 "Lic. en Artes", add
label define idcarr 165 "Tec. Artes P. y V.", add
label define idcarr 166 "Tec. Tecn. Imag. Foto.", add
label define idcarr 122 "CC de la Educ.", add
label define idcarr 6002 "TUA", add
label define idcarr 5002 "Lic. en Comunicación", add
label define idcarr 43 "Lic. en Estadística", add
label define idcarr 123 "Lic. en Historia", add
label define idcarr 41 "Contador Publico", add
label define idcarr 44 "Lic. en Economía", add
label define idcarr 45 "Lic. en Administración", add
label define idcarr 49 "FCEA-Basico", add
label define idcarr 124 "Lic. en Filosofía", add
label define idcarr 125 "Lic. en Letras", add
label define idcarr 126 "Lic. en linguistica", add
label define idcarr 127 "Téc. Turismo", add
label define idcarr 238 "CI-FCS", add
label define idcarr 129 "Tec.Corr.Estilo", add
label define idcarr 2001 "Lic. en Bibliotecología", add
label define idcarr 2003 "Lic. en Archivología", add
label define idcarr 55 "Traductorado Publico", add
label define idcarr 58 "Abogacía", add
label define idcarr 59 "Notariado", add
label define idcarr 52 "Rel. Laborales", add
label define idcarr 239 "Trabajo Social", add
label define idcarr 3001 "Dip. en Música", add
label define idcarr 161 "Lic. LyM Audiovis.", add
label define idcarr 3002 "Tec. en Int. Musical", add
label define idcarr 1215 "Tec.Univ.Int.L. de Señas", add
label define idcarr 1216 "Lic. en Museología", add
label define idcarr 1271 "Lic. en Turismo", add
label values idcarr idcarr

*Eliminamos los estudiantes colados de carreras de posgrado*
drop if carrfac==400201

*Identificamos al Interior, por cenur*
gen car_int=.
replace car_int=1 if carrfac==1300101 | carrfac==1302701 | carrfac==1302801 | carrfac==1302901 | carrfac==1303001 | carrfac==1308901 | carrfac==1309001 | carrfac==30001400
replace car_int=2 if carrfac==99005501 | idcarr==161 | idcarr==165
replace car_int=3 if carrfac==99000606 | carrfac==401500
replace car_int=4 if carrfac==20005501 | idcarr==166

label define car_int 1 "RN"
label define car_int 2 "CURE", add
label define car_int 3 "CUT", add
label define car_int 4 "CUP", add
label values car_int car_int
*Asignamos las carreras del interior a una Facultad*
replace cod_fac=4 if carrfac==99005501 | carrfac==401500  | carrfac==99005401
replace cod_fac=300 if carrfac==1302701 | carrfac==1302801 | carrfac==1302901 | carrfac==1303001 | carrfac==30001400
replace cod_fac=23 if carrfac==1300101
replace cod_fac=200 if carrfac==20005501
replace cod_fac=5 if carrfac==1308901 | carrfac==1309001
replace cod_fac=16 if idcarr==161 | idcarr==165 | idcarr==166

***********************************************************************************2014*********************************************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2014, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop ci fac, force
*pad_edu_seciu_2011 y mad_edu_seciu_2011 tienen escala LABE*
*ed_madre y ed_padre tienen escala LABD==LABE*
*ed_madre_2013 y ed_padre_2013 tienen escala LABF*
*ed_madre_2014 y ed_padre_2014 tienen escala LABG*
*no tenemos datos sobre primaria incompleta para todos, asumimos primaria incompleta=ninguna instruccion, para terc incomp tambien lo cambie*
*Use como etiquetado final el LABed de la base 2010, creado en base a la info disponible en todas las bases*
*RECODIFICACION*
replace ed_padre= 1 if ed_padre==2
replace ed_madre= 1 if ed_madre==2
replace ed_padre= 2 if ed_padre==3
replace ed_madre= 2 if ed_madre==3
replace ed_padre= 3 if ed_padre==4
replace ed_madre= 3 if ed_madre==4
replace ed_padre= 4 if ed_padre==5
replace ed_madre= 4 if ed_madre==5
replace ed_padre= 5 if ed_padre==10
replace ed_madre= 5 if ed_madre==10
replace ed_padre= 6 if ed_padre==11
replace ed_madre= 6 if ed_madre==11
replace ed_padre= 7 if ed_padre==12
replace ed_madre= 7 if ed_madre==12
replace ed_padre= 8 if ed_padre==13
replace ed_madre= 8 if ed_madre==13
egen proc_maxpedu = rowmax(ed_padre ed_madre)
label define LABed 1 "S/inst-Prim.Incomp" 2 "Prim.Comp." 3 "Ed.Media.Incp" 4 "Ed.Media.Cmpl" 5 "Terc.No.Univ.Incmp" 6 "Terc.No.Univ.Cmpl" 7 "Univ.Incmpl" 8 "Univ.Cmpl" 99 "Residual"
label values proc_maxpedu LABed

*EDAD*
nsplit fecha_nac, digits (4)
rename fecha_nac1 año_nac
gen edad = 2014 - año_nac
replace edad=. if edad==0

*Re-etiquetamos las carreras, OJO:se etiquetan por igual sin importar la localizacion del centro donde se dicta la carrera*
gen idcarr=.
replace idcarr=30070 if carrfac==30007000 | carrfac==30007002 | carrfac==30007004 | carrfac==30007003 | carrfac==30007020 | carrfac==30006900 | carrfac==30006902 | carrfac==30006903 | carrfac==30006904 | carrfac==30006905 | carrfac==30006906 | carrfac==30006907 | carrfac==30006908 | carrfac==30006909 | carrfac==30006910 | carrfac==30006911 | carrfac==30006912 | carrfac==30006913 | carrfac==30006914 | carrfac==30006915 | carrfac==30006916 | carrfac==30006917 | carrfac==30006918 | carrfac==30006919 | carrfac==30006920
replace idcarr=30071 if carrfac==30007100 | carrfac==30007105 | carrfac==30007106 | carrfac==30007107 | carrfac==30007108 | carrfac==30007109 | carrfac==30007110 | carrfac==30007111 | carrfac==30007112 | carrfac==30007113 | carrfac==30007114 | carrfac==30007115 |carrfac==30007116 | carrfac==30007117 | carrfac==30007118 | carrfac==30007119 | carrfac==30007120 | carrfac==30007121
replace idcarr=121   if carrfac==1200109 | carrfac==1200102 | carrfac==1200103 | carrfac==1209001
replace idcarr=51   if carrfac==500101 | carrfac==500201 | carrfac==501801
replace idcarr=42 if carrfac==401500 | carrfac==401510 | carrfac==99600606 | carrfac==99605401 | carrfac==99605501 | carrfac==99605601
replace idcarr=162   if carrfac==1600202 | carrfac==1600203 | carrfac==1600204 | carrfac==1600205 | carrfac==1600206 | carrfac==1600207 | carrfac==1600208 | carrfac==1600302 | carrfac==1600303 | carrfac==1600802 | carrfac==1600808
replace idcarr=122   if carrfac==1200209 | carrfac==1209101 | carrfac==1200203 | carrfac==1200202 | carrfac==1202201 | carrfac==1202101
replace idcarr=6002   if carrfac==60000201 | carrfac==60000101 | carrfac==60000102 | carrfac==60002201 | carrfac==60002400 | carrfac==60004401 | carrfac==402400
replace idcarr=5002   if carrfac==50000101 | carrfac==50000102 | carrfac==50000103 | carrfac==50000105 | carrfac==50000201 | carrfac==50000300 | carrfac==50000301 | carrfac==50000302 | carrfac==50000305 | carrfac==50000306 | carrfac==50000401 | carrfac==50000501
replace idcarr=43 if carrfac==400301 | carrfac==400302 | carrfac==400303
replace idcarr=123 if carrfac==1200302 | carrfac==1200303 | carrfac==1200309 | carrfac==1209201
replace idcarr=41 if carrfac==400401 | carrfac==400704 | carrfac==401100
replace idcarr=44 if carrfac==400402 | carrfac==400605 | carrfac==400702 | carrfac==401200
replace idcarr=45 if carrfac==400404 | carrfac==400405 | carrfac==401400
replace idcarr=49 if carrfac==404910 | carrfac==400409 | carrfac==400109
replace idcarr=124 if carrfac==1200402 | carrfac==1200403 | carrfac==1200409 | carrfac==1204701 | carrfac==1204401 | carrfac==1204301 | carrfac==1204201 | carrfac==1204101 | carrfac==1204701
replace idcarr=125 if carrfac==1200509 | carrfac==1200502 | carrfac==1200503 | carrfac==1205101 | carrfac==1205102 | carrfac==1205103 | carrfac==1205104 | carrfac==1205106 | carrfac==1205107 | carrfac==1205109 | carrfac==1205201 | carrfac==1205301 | carrfac==1209301
replace idcarr=126 if carrfac==1200602 | carrfac==1200603 | carrfac==1200609 | carrfac==1200631 | carrfac==1206102 | carrfac==1206103 | carrfac==1206104 | carrfac==1206109 | carrfac==1206201 | carrfac==1209401
replace idcarr=127 if carrfac==120701 | carrfac==127101
replace idcarr=238 if carrfac==230801 | carrfac==2300801 | carrfac==2300901 | carrfac==2390101 | carrfac==1300101
replace idcarr=129 if carrfac==1200901 | carrfac==1209501
replace idcarr=2001 if carrfac==20000201 | carrfac==20001101 | carrfac==20002101 | carrfac==20002201 | carrfac==20006601
replace idcarr=2003 if carrfac==20000101 | carrfac==20003101 | carrfac==20003201 | carrfac==20005501 | carrfac==20003301
replace idcarr=55 if carrfac==505001 | carrfac==505101 | carrfac==505201 | carrfac==505301 | carrfac==505401
replace idcarr=58 if carrfac==505701 | carrfac==508001 | carrfac==508401 | carrfac==508901 | carrfac==508995 | carrfac==504201 | carrfac==50100 | carrfac==500501 | carrfac==507001 | carrfac==1308901
replace idcarr=59 if carrfac==50200 | carrfac==500601 | carrfac==57002 | carrfac==505801 | carrfac==508501 | carrfac==509001 | carrfac==509095 | carrfac==508101 | carrfac==507002 | carrfac==1309001
replace idcarr=52 if carrfac==509501 | carrfac==59595 | carrfac==59101 | carrfac==501201 | carrfac==501301
replace idcarr=239 if carrfac==1300201 | carrfac==1300202 | carrfac==2301004 | carrfac==2300301 | carrfac==2300302 | carrfac==2300401
replace idcarr=3001 if carrfac==3000101 | carrfac==3000102 | carrfac==3000103 | carrfac==3000104 | carrfac==3001100
replace idcarr=161 if carrfac==1601212 | carrfac==99601212
replace idcarr=3002 if carrfac==30001400
replace idcarr=1215 if carrfac==1201501
replace idcarr=1216 if carrfac==1201601 | carrfac==1201603 | carrfac==1201604 | carrfac==1201605 | carrfac==1201606 | carrfac==1201607
replace idcarr=1271 if carrfac==127110 | carrfac==1201301 | carrfac==1201401 | carrfac==1207101 | carrfac==1207110 | carrfac==99607101
replace idcarr=12711 if carrfac==1301301
replace idcarr=132 if carrfac==1302701 | carrfac==1302801 | carrfac==1302901
replace idcarr=133 if carrfac==1303001
replace idcarr=1611 if carrfac==1308181 | carrfac==99608181
replace idcarr=138 if carrfac==1308383 | carrfac==99600202 | carrfac==99608383
replace idcarr=996 if carrfac==99600404
replace idcarr=165 if carrfac==99601001

label define idcarr 30070 "Lic. en Música"
label define idcarr 30071 "Lic. en Interpretacion", add
label define idcarr 121 "Antropología", add
label define idcarr 51 "Rel. Int.", add
label define idcarr 42 "TAC", add
label define idcarr 162 "Lic. en Artes", add
label define idcarr 122 "CC de la Educ.", add
label define idcarr 6002 "TUA", add
label define idcarr 5002 "Lic. en Comunicación", add
label define idcarr 43 "Lic. en Estadística", add
label define idcarr 123 "Lic. en Historia", add
label define idcarr 41 "Contador Publico", add
label define idcarr 44 "Lic. en Economía", add
label define idcarr 45 "Lic. en Administración", add
label define idcarr 49 "FCEA-Basico", add
label define idcarr 124 "Lic. en Filosofía", add
label define idcarr 125 "Lic. en Letras", add
label define idcarr 126 "Lic. en linguistica", add
label define idcarr 127 "Téc. Turismo", add
label define idcarr 238 "CI-FCS", add
label define idcarr 129 "Tec.Corr.Estilo", add
label define idcarr 2001 "Lic. en Bibliotecología", add
label define idcarr 2003 "Lic. en Archivología", add
label define idcarr 55 "Traductorado Publico", add
label define idcarr 58 "Abogacía", add
label define idcarr 59 "Notariado", add
label define idcarr 52 "Rel. Laborales", add
label define idcarr 239 "Trabajo Social", add
label define idcarr 3001 "Dip. en Música", add
label define idcarr 161 "Lic. LyM Audiovis.", add
label define idcarr 3002 "Tec. en Int. Musical", add
label define idcarr 1215 "Tec.Univ.Int.L. de Señas", add
label define idcarr 1216 "Lic. en Museología", add
label define idcarr 1271 "Lic. en Turismo", add
label define idcarr 12711 "Lic. Binac. en Turismo", add
label define idcarr 132 "Tec. en Interpretación", add
label define idcarr 133 "Tec. Dirección Coros", add
label define idcarr 1611 "Tec. Imagen Fotog.", add
label define idcarr 138 "Tec. Univ. Bienes Culturales", add
label define idcarr 996 "Tec. en Des. Reg. Sust.", add
label define idcarr 165 "Tec. Artes P. y V.", add
label values idcarr idcarr

*Identificamos al Interior, por cenur*
gen car_int=.
replace car_int=1 if carrfac==1300101 | carrfac==1308901 | carrfac==1309001 | carrfac==1301301 | carrfac==1302701 | carrfac==1302801 | carrfac==1302901 | carrfac==1303001
replace car_int=2 if carrfac==99601001 | carrfac==99601212 | carrfac==99607101 | carrfac==99605601 | carrfac==99605401 | carrfac==99605501
replace car_int=3 if carrfac==401500 | carrfac==99600202 | carrfac==99600404 | carrfac==99600606
replace car_int=4 if carrfac==1308181 | carrfac==1308383 | carrfac==99608181 | carrfac==99608383

label define car_int 1 "RN"
label define car_int 2 "CURE", add
label define car_int 3 "CUT", add
label define car_int 4 "CUP", add
label values car_int car_int

*Asignamos las carreras del interior a una Facultad*
replace fac=4 if carrfac==99605401 | carrfac==99605501 | carrfac==99605601 | carrfac==99600606 | carrfac==401500
replace fac=300 if carrfac==1302801 | carrfac==1302701 | carrfac==1303001
replace fac=23 if carrfac==99600404 | carrfac==1300101
replace fac=12 if carrfac==99607101 | carrfac==99600202 | carrfac==1308383 | carrfac==99608383 | carrfac==1301301
replace fac=5 if carrfac==1308901
replace fac=16 if carrfac==99601001 | carrfac==99601212 | carrfac==1308181 | carrfac==99608181
**************************************************************************************************************************************************************
* Ingresos al área según condición de solicitud de becas******************************************************************************************************
**************************************************************************************************************************************************************
***********************************************************************************2010***********************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2010_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop c_i cod_fac, force
tab beca cod_fac
***********************************************************************************2011***********************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2011_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop cedula cod_fac, force
tab becas cod_fac
***********************************************************************************2012***********************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2012_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values facultad facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop c_i facultad, force
*Eliminamos los estudiantes colados de carreras de posgrado*
drop if carfac==2004401
tab becas facultad
***********************************************************************************2013***********************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2013_final, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values cod_fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop ci cod_fac, force
tab beca cod_fac
***********************************************************************************2014***********************************************************************
clear all 
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Ingresos 2010_2014"
use ing_social_y_art_stica_2014, clear
set more off
set dp com
*Re-etiquetamos los valores de las facultades*
label define facultade 4 "FCEA"
label define facultade 300 "EUMUS", add
label define facultade 23 "FCS", add
label define facultade 12 "FHUCE", add
label define facultade 5 "FDER", add
label define facultade 16 "ENBA", add
label define facultade 200 "EUBCA", add
label define facultade 500 "FIC", add
label define facultade 600 "EDA", add
label values fac facultade
*Eliminamos las duplicaciones de cedula y facultad para cada estudiante*
duplicates drop ci fac, force
tab beca fac

