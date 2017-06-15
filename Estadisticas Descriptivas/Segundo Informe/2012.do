clear
cd "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts"
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


gen interior=1 if car_int!=.
replace interior=0 if car_int==.

g fac2=facultad
replace fac2=25000 if car_int!=.
label define fac2 4 "FCEA"
label define fac2 300 "EUMUS", add
label define fac2 23 "FCS", add
label define fac2 12 "FHUCE", add
label define fac2 5 "FDER", add
label define fac2 16 "ENBA", add
label define fac2 200 "EUBCA", add
label define fac2 500 "FIC", add
label define fac2 600 "EDA", add
label define fac2 25000 "Interior", add
label values fac2 fac2

gen proc_reg=.
replace proc_reg=1 if res_marzo==1
replace proc_reg=2 if res_marzo!=1 & res_marzo<=19
replace proc_reg=3 if res_marzo>19 & res_marzo!=.

*barrio*
gen NBI_barrio = 60.1 if barrio==30 
*incluye municipal*
replace NBI_barrio = 52.8 if barrio==61
replace NBI_barrio = 47.6 if barrio==31
replace NBI_barrio = 47.4 if barrio==37
replace NBI_barrio = 47.3 if barrio==20
replace NBI_barrio = 47.3 if barrio==56
replace NBI_barrio = 44.9 if barrio==16
replace NBI_barrio = 44.6 if barrio==36 
*incluye sta. catalina*
replace NBI_barrio = 44.0 if barrio==62
replace NBI_barrio = 42.5 if barrio==21
replace NBI_barrio = 41.7 if barrio==44
replace NBI_barrio = 41.2 if barrio==55
replace NBI_barrio = 40.4 if barrio==29
replace NBI_barrio = 39.8 if barrio==57 
*incluye pajas blancas, los bulevares*
replace NBI_barrio = 38.2 if barrio==59
replace NBI_barrio = 36.9 if barrio==52
replace NBI_barrio = 34.7 if barrio==33
replace NBI_barrio = 34.1 if barrio==22
replace NBI_barrio = 33.5 if barrio==35
replace NBI_barrio = 32.7 if barrio==17 
*incluye hipÓdromo, zabala*
replace NBI_barrio = 32.5 if barrio==18
replace NBI_barrio = 31.9 if barrio==25
replace NBI_barrio = 31.4 if barrio==1
replace NBI_barrio = 30.5 if barrio==12 
*incluye malvin alto, pque. rivera
replace NBI_barrio = 29.0 if barrio==58 
*incluye ferrocarril*
replace NBI_barrio = 28.8 if barrio==69 
*incluye villa colon*
replace NBI_barrio = 28.5 if barrio==38
replace NBI_barrio = 27.5 if barrio==27 
*incluye fraternidad*
replace NBI_barrio = 26.3 if barrio==19
replace NBI_barrio = 25.3 if barrio==27
replace NBI_barrio = 24.5 if barrio==54 
*incluye paso molino*
replace NBI_barrio = 24.2 if barrio==41
replace NBI_barrio = 23.9 if barrio==47 
*incluye goes*
replace NBI_barrio = 23.6 if barrio==4
replace NBI_barrio = 22.0 if barrio==2
replace NBI_barrio = 21.4 if barrio==24
replace NBI_barrio = 21.1 if barrio==23
replace NBI_barrio = 20.9 if barrio==3
replace NBI_barrio = 20.1 if barrio==48
replace NBI_barrio = 19.1 if barrio==5
replace NBI_barrio = 17.7 if barrio==40 
*incluye arroyo seco*
replace NBI_barrio = 17.7 if barrio==42
replace NBI_barrio = 17.1 if barrio==26
replace NBI_barrio = 17.1 if barrio==44
replace NBI_barrio = 16.3 if barrio==53  
*incluye la floresta*
replace NBI_barrio = 15.9 if barrio==49
replace NBI_barrio = 15.8 if barrio==51
replace NBI_barrio = 15.2 if barrio==15
replace NBI_barrio = 14.5 if barrio==50
replace NBI_barrio = 14.3 if barrio==32
replace NBI_barrio = 11.7 if barrio==39 
*incluye paso molino*
replace NBI_barrio = 11.6 if barrio==45
replace NBI_barrio = 11.2 if barrio==6
replace NBI_barrio = 10.2 if barrio==10 
*incluye belgrano*
replace NBI_barrio = 9.5 if barrio==46
replace NBI_barrio = 9.3 if barrio==43 
*incluye pque. posadas*
replace NBI_barrio = 8.2 if barrio==8 
*incluye pocitos nuevo, villa biarritz*
replace NBI_barrio = 7.8 if barrio==7
replace NBI_barrio = 7.1 if barrio==11 
*incluye malvin nuevo*
replace NBI_barrio = 3.9 if barrio==13
replace NBI_barrio = 3.7 if barrio==14

gen NBI = 1 if NBI_barrio <=10
replace NBI = 2 if  (NBI_barrio <=20 & NBI_barrio>10 & NBI_barrio!=.)
replace NBI = 3 if  (NBI_barrio <=30 & NBI_barrio>20 & NBI_barrio!=.)
replace NBI = 4 if  (NBI_barrio <=40 & NBI_barrio>30 & NBI_barrio!=.)
replace NBI = 5 if  (NBI_barrio <=50 & NBI_barrio>40 & NBI_barrio!=.)
replace NBI = 6 if  (NBI_barrio <=60 & NBI_barrio>50 & NBI_barrio!=.)
replace NBI = 7 if  (NBI_barrio <=70 & NBI_barrio>60 & NBI_barrio!=.)
replace NBI = 8 if  (NBI_barrio <=80 & NBI_barrio>70 & NBI_barrio!=.)
label define nbi 1 "Barrios con menos de 10% de personas con al menos una NBI"
label define nbi 2 "Barrios con entre 10% y 20% de personas con al menos una NBI", add
label define nbi 3 "Barrios con entre 20% y 30% de personas con al menos una NBI", add
label define nbi 4 "Barrios con entre 30% y 40% de personas con al menos una NBI", add
label define nbi 5 "Barrios con entre 40% y 50% de personas con al menos una NBI", add
label define nbi 6 "Barrios con entre 50% y 60% de personas con al menos una NBI", add
label define nbi 7 "Barrios con entre 60% y 70% de personas con al menos una NBI", add
label values NBI nbi

gen NBI2 = 1 if NBI_barrio >=0 & NBI_barrio<=14.3
replace NBI2 = 2 if  (NBI_barrio <=21.1 & NBI_barrio>14.3 & NBI_barrio!=.)
replace NBI2 = 3 if  (NBI_barrio <=29.0 & NBI_barrio>21.1 & NBI_barrio!=.)
replace NBI2 = 4 if  (NBI_barrio <=40.4 & NBI_barrio>29.0 & NBI_barrio!=.)
replace NBI2 = 5 if  (NBI_barrio <=60.1 & NBI_barrio>40.4 & NBI_barrio!=.)

label define nbi2 1 "0 a 14.3"
label define nbi2 2 "14.3 a 21.1", add
label define nbi2 3 "21.1 a 29.0", add
label define nbi2 4 "29.0 a 40.4", add
label define nbi2 5 "40.4 a 60.1", add
label values NBI2 nbi2


gen fac3=facultad
replace fac3=4 if fac3==600
replace fac3=500 if fac3==200
label define fac3 4 "FCEA"
label define fac3 300 "EUMUS", add
label define fac3 23 "FCS", add
label define fac3 12 "FHUCE", add
label define fac3 5 "FDER", add
label define fac3 16 "ENBA", add
label define fac3 200 "EUBCA", add
label define fac3 500 "FIC", add
label define fac3 600 "EDA", add
label values fac3 fac3

*tipo de hogar*
gen tipo_hogar = 1 if viv_solo==1
replace tipo_hogar = 2 if  padres==2 | padres==1 & cony_p_m==1
replace tipo_hogar = 3 if padres==1 & cony_p_m==0
replace tipo_hogar = 4 if conyug==1 & hij_num==0
replace tipo_hogar = 5 if conyug ==1 & hij_num!=0 &hij_num!=.
replace tipo_hogar = 6 if conyug==0 &  hij_num!=0 &hij_num!=.
replace tipo_hogar = 7 if padres==0& hij_num==0 & conyug==0 & viv_solo==0 & estud==0 & otros==0
replace tipo_hogar = 8 if padres==0& hij_num==0 & conyug==0 & viv_solo==0 & (estud!=0 | otros!=0)
label define tipohogar 1 "Unipersonal"
label define tipohogar 2 "Nuclear de padres", add
label define tipohogar 3 "Monoparental de padres", add
label define tipohogar 4 "Nuclear sin hijos", add
label define tipohogar 5 "Nuclear con hijos", add
label define tipohogar 6 "Monoparental", add
label define tipohogar 7 "No nuclear extendido", add
label define tipohogar 8 "No nuclear compuesto", add
label values tipo_hogar tipohogar

gen fac4=facultad
replace fac4=4 if fac4==600
replace fac4=500 if fac4==200
replace fac4=25000 if car_int!=.
label define fac4 4 "FCEA"
label define fac4 300 "EUMUS", add
label define fac4 23 "FCS", add
label define fac4 12 "FHUCE", add
label define fac4 5 "FDER", add
label define fac4 16 "ENBA", add
label define fac4 200 "EUBCA", add
label define fac4 500 "FIC", add
label define fac4 600 "EDA", add
label define fac4 25000 "Interior",add
label values fac4 fac4
