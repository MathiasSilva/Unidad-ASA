clear 
cd "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts"
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
gen edad = 2010 - año_nac
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


g fac2=cod_fac
replace fac2=25000 if car_int!=.
label define fac2 4 "FCEA"
label define fac2 300 "EUMUS", add
label define fac2 23 "FCS", add
label define fac2 12 "FHUCE", add
label define fac2 5 "FDER", add
label define fac2 16 "ENBA", add
label define fac2 200 "EUBCA", add
label define fac2 500 "LICCOM", add
label define fac2 600 "EDA", add
label define fac2 25000 "Interior", add
label values fac2 fac2

*Procedencia segun ocupacion de padres*
replace ocup_pad=0 if ocup_pad==1 | ocup_pad==2 | ocup_pad==16 | ocup_pad==17 | ocup_pad_2013==1 | ocup_pad_2013==2 | ocup_pad_2013==16 | ocup_pad_2013==17 | ocup_pad_2014==1
replace ocup_pad=1 if ocup_pad==3 | ocup_pad==5 | ocup_pad==20 | ocup_pad==7 | ocup_pad==9 | ocup_pad==22 | ocup_pad==13 | ocup_pad_2013==3 | ocup_pad_2013==5 | ocup_pad_2013==7 | ocup_pad_2013==9 | ocup_pad_2013==22 | ocup_pad_2013==25 | ocup_pad_2013==27 | ocup_pad_2013==13
replace ocup_pad=1 if ocup_pad_2014!=1 & cat_oc_pad==1
replace ocup_pad=2 if ocup_pad==4 | ocup_pad==6 | ocup_pad==8 | ocup_pad==10 | ocup_pad==14 | ocup_pad==15 | ocup_pad==21 | ocup_pad==23 | ocup_pad_2013==4 | ocup_pad_2013==6 | ocup_pad_2013==8 | ocup_pad_2013==10 | ocup_pad_2013==14 | ocup_pad_2013==15 | ocup_pad_2013==23 | ocup_pad_2013==26 | ocup_pad_2013==28
replace ocup_pad=2 if cat_oc_pad==2 & ocup_pad_2014!=1
replace ocup_pad=3 if ocup_pad==11 | ocup_pad==12 | ocup_pad_2013==11 | ocup_pad_2013==12 | cat_oc_pad==5
replace ocup_pad=4 if ocup_pad==18 | ocup_pad==19 | ocup_pad==24 | ocup_pad_2013==18 | ocup_pad_2013==19 | ocup_pad_2013==24 | cat_oc_pad==99 
replace ocup_pad=99 if ocup_pad==25 | ocup_pad_2013==99 | ocup_pad_2014==99
replace ocup_mad=0 if ocup_mad==1 | ocup_mad==2 | ocup_mad==16 | ocup_mad==17 | ocup_mad_2013==1 | ocup_mad_2013==2 | ocup_mad_2013==16 | ocup_mad_2013==17 | ocup_mad_2014==1
replace ocup_mad=1 if ocup_mad==3 | ocup_mad==5 | ocup_mad==20 | ocup_mad==7 | ocup_mad==9 | ocup_mad==22 | ocup_mad==13 | ocup_mad_2013==3 | ocup_mad_2013==5 | ocup_mad_2013==7 | ocup_mad_2013==9 | ocup_mad_2013==22 | ocup_mad_2013==25 | ocup_mad_2013==27 | ocup_mad_2013==13
replace ocup_mad=1 if ocup_mad_2014!=1 & cat_oc_mad==1
replace ocup_mad=2 if ocup_mad==4 | ocup_mad==6 | ocup_mad==8 | ocup_mad==10 | ocup_mad==14 | ocup_mad==15 | ocup_mad==21 | ocup_mad==23 | ocup_mad_2013==4 | ocup_mad_2013==6 | ocup_mad_2013==8 | ocup_mad_2013==10 | ocup_mad_2013==14 | ocup_mad_2013==15 | ocup_mad_2013==23 | ocup_mad_2013==26 | ocup_mad_2013==28
replace ocup_mad=2 if cat_oc_mad==2 & ocup_mad_2014!=1
replace ocup_mad=3 if ocup_mad==11 | ocup_mad==12 | ocup_mad_2013==11 | ocup_mad_2013==12 | cat_oc_mad==5
replace ocup_mad=4 if ocup_mad==18 | ocup_mad==19 | ocup_mad==24 | ocup_mad_2013==18 | ocup_mad_2013==19 | ocup_mad_2013==24 | cat_oc_mad==99 
replace ocup_mad=99 if ocup_mad==25 | ocup_mad_2013==99 | ocup_mad_2014==99

label define ocupnos 0 "Direccion/rentas"  
label define ocupnos 1 "Asal. Privado", add
label define ocupnos 2 "Asal. Público", add
label define ocupnos 3 "Trab. Indep.", add
label define ocupnos 4 "Trab. No rem./No trabaja", add
label define ocupnos 99 "S/D", add
label values ocup_pad ocupnos
label values ocup_mad ocupnos

*cursa otra carrera?*
replace ins_otr1=. if otro_est==0 & ins_otr1==1
replace ins_otr1 = . if ins_otr1==9
replace ins_otr1 = 0 if otro_est==0
label define estudios 0 "No cursa/cursó otros estudios"
label define estudios 1 "UDELAR", add
label define estudios 2 "UCUDAL", add
label define estudios 3 "UNIV. DE MONTEVIDEO", add
label define estudios 4 "ORT", add
label define estudios 5 "UNIVERSIDAD DE LA EMPRESA", add
label define estudios 6 "OTRA UNIVERSIDAD PRIVADA", add
label define estudios 7 "NO UNIVERSIDAD PÚBLICA", add
label define estudios 8 "NO UNIVERSIDAD PRIVADA", add
label values ins_otr1 estudios

cap drop ins_otr1_0 ins_otr1_1 ins_otr1_2 ins_otr1_3 ins_otr1_4 ins_otr1_5 ins_otr1_6 ins_otr1_7 ins_otr1_8
gen ins_otr1_0=. 
replace ins_otr1_0=1 if ins_otr1==0
replace ins_otr1_0=0 if ins_otr1!=0
gen ins_otr1_1=. 
replace ins_otr1_1=1 if ins_otr1==1
replace ins_otr1_1=0 if ins_otr1!=1
gen ins_otr1_2=. 
replace ins_otr1_2=1 if ins_otr1==2
replace ins_otr1_2=0 if ins_otr1!=2
gen ins_otr1_3=. 
replace ins_otr1_3=1 if ins_otr1==3
replace ins_otr1_3=0 if ins_otr1!=3
gen ins_otr1_4=. 
replace ins_otr1_4=1 if ins_otr1==4
replace ins_otr1_4=0 if ins_otr1!=4
gen ins_otr1_5=. 
replace ins_otr1_5=1 if ins_otr1==5
replace ins_otr1_5=0 if ins_otr1!=5
gen ins_otr1_6=. 
replace ins_otr1_6=1 if ins_otr1==6
replace ins_otr1_6=0 if ins_otr1!=6
gen ins_otr1_7=. 
replace ins_otr1_7=1 if ins_otr1==7
replace ins_otr1_7=0 if ins_otr1!=7
gen ins_otr1_8=. 
replace ins_otr1_8=1 if ins_otr1==8
replace ins_otr1_8=0 if ins_otr1!=8

replace sec_6 =3 if sec_6==5
replace sec_6 =3 if sec_6==7
replace sec_6 =4 if sec_6==6
replace sec_6 =4 if sec_6==8
label define secundari 0 "No cursó"
label define secundari 1 "Montevideo - Pública", add
label define secundari 2 "Montevideo - Privada", add
label define secundari 3 "Interior - Pública", add
label define secundari 4 "Interior - Privada", add
label define secundari 9 "Exterior - Pública", add
label define secundari 10 "Exterior - Privada", add
label define secundari 11 "6º Año Plan Microexperiencia", add
label values sec_6 secundari
