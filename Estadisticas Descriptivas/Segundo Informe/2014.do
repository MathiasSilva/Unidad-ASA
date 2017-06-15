clear 
cd "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts"
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


gen interior=1 if car_int!=.
replace interior=0 if car_int==.

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

*Procedencia segun ocupacion de padres*
gen nocup_pad=.
gen nocup_mad=.
replace nocup_pad=0 if ocup_pad_form_2013==1 | ocup_pad_form_2013==2 | ocup_pad_form_2013==16 | ocup_pad_form_2013==17 | ocup_pad==1 | cat_oc_pad==4
replace nocup_pad=1 if ocup_pad_form_2013==3 | ocup_pad_form_2013==5 | ocup_pad_form_2013==7 | ocup_pad_form_2013==9 | ocup_pad_form_2013==22 | ocup_pad_form_2013==25 | ocup_pad_form_2013==27 | ocup_pad_form_2013==13 | (cat_oc_pad==3 & ocup_pad!=1)
replace nocup_pad=1 if ocup_pad!=1 & cat_oc_pad==1
replace nocup_pad=2 if ocup_pad_form_2013==4 | ocup_pad_form_2013==6 | ocup_pad_form_2013==8 | ocup_pad_form_2013==10 | ocup_pad_form_2013==14 | ocup_pad_form_2013==15 | ocup_pad_form_2013==23 | ocup_pad_form_2013==26 | ocup_pad_form_2013==28 | ocup_pad==9
replace nocup_pad=2 if cat_oc_pad==2 & ocup_pad!=1
replace nocup_pad=3 if ocup_pad_form_2013==11 | ocup_pad_form_2013==12 | cat_oc_pad==5
replace nocup_pad=4 if ocup_pad_form_2013==18 | ocup_pad_form_2013==19 | ocup_pad_form_2013==24 | cat_oc_pad==99  | cat_oc_pad==8
replace nocup_pad=99 if ocup_pad_form_2013==99 | ocup_pad==99
replace nocup_mad=0 if ocup_mad_form_2013==1 | ocup_mad_form_2013==2 | ocup_mad_form_2013==16 | ocup_mad_form_2013==17 | ocup_mad==1 | cat_oc_mad==4
replace nocup_mad=1 if ocup_mad_form_2013==3 | ocup_mad_form_2013==5 | ocup_mad_form_2013==7 | ocup_mad_form_2013==9 | ocup_mad_form_2013==22 | ocup_mad_form_2013==25 | ocup_mad_form_2013==27 | ocup_mad_form_2013==13 | (cat_oc_mad==3 & ocup_mad!=1)
replace nocup_mad=1 if ocup_mad!=1 & cat_oc_mad==1
replace nocup_mad=2 if ocup_mad_form_2013==4 | ocup_mad_form_2013==6 | ocup_mad_form_2013==8 | ocup_mad_form_2013==10 | ocup_mad_form_2013==14 | ocup_mad_form_2013==15 | ocup_mad_form_2013==23 | ocup_mad_form_2013==26 | ocup_mad_form_2013==28 | ocup_mad==9
replace nocup_mad=2 if cat_oc_mad==2 & ocup_mad!=1
replace nocup_mad=3 if ocup_mad_form_2013==11 | ocup_mad_form_2013==12 | cat_oc_mad==5 | cat_oc_mad==8
replace nocup_mad=4 if ocup_mad_form_2013==18 | ocup_mad_form_2013==19 | ocup_mad_form_2013==24 | cat_oc_mad==99 
replace nocup_mad=99 if ocup_mad_form_2013==99 | ocup_mad==99

label define ocupnos 0 "Direccion/rentas"  
label define ocupnos 1 "Asal. Privado", add
label define ocupnos 2 "Asal. Público", add
label define ocupnos 3 "Trab. Indep.", add
label define ocupnos 4 "Trab. No rem./No trabaja", add
label define ocupnos 99 "S/D", add
label values nocup_pad ocupnos
label values nocup_mad ocupnos


gen fac3=fac
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
replace tipo_hogar = 2 if  padres==2 | padres==1 & cony_pad==1
replace tipo_hogar = 3 if padres==1 & cony_pad==0
replace tipo_hogar = 4 if conyug==1 & hijos==0
replace tipo_hogar = 5 if conyug ==1 & hijos!=0 &hijos!=.
replace tipo_hogar = 6 if conyug==0 &  hijos!=0 &hijos!=.
replace tipo_hogar = 7 if padres==0& hijos==0 & conyug==0 & viv_solo==0 & est_otro==0 & per_otro==0
replace tipo_hogar = 8 if padres==0& hijos==0 & conyug==0 & viv_solo==0 & (est_otro!=0 | per_otro!=0)
label define tipohogar 1 "Unipersonal"
label define tipohogar 2 "Nuclear de padres", add
label define tipohogar 3 "Monoparental de padres", add
label define tipohogar 4 "Nuclear sin hijos", add
label define tipohogar 5 "Nuclear con hijos", add
label define tipohogar 6 "Monoparental", add
label define tipohogar 7 "No nuclear extendido", add
label define tipohogar 8 "No nuclear compuesto", add
label values tipo_hogar tipohogar

gen fac4=fac
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
