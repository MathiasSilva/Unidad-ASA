
*Cuadro 1
*Se hizo a mano a partir del ultimo informe de dgplan

*Figura 1


*Figura 2
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"

histogram edad if sexo==1, discrete width(1) percent ytitle(% del Total de Inscriptos) xtitle(Edad) title("Distribución de Hombres Inscriptos según Edad", size(medsmall)) subtitle((2010)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_11.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_11.gph", replace
histogram edad if sexo==2, discrete width(1) percent ytitle(% del Total de Inscriptos) xtitle(Edad) title("Distribución de Mujeres Inscriptas según Edad", size(medsmall)) subtitle((2010)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_12.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_12.gph", replace

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"

histogram edad if sexo==1, discrete width(1) percent ytitle(% del Total de Inscriptos) xtitle(Edad) title("Distribución de Hombres Inscriptos según Edad", size(medsmall)) subtitle((2015)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_21.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_21.gph", replace
histogram edad if sexo==2, discrete width(1) percent ytitle(% del Total de Inscriptos) xtitle(Edad) title("Distribución de Mujeres Inscriptas según Edad", size(medsmall)) subtitle((2015)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_22.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_22.gph", replace

graph combine "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_11.gph" "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_21.gph" "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_12.gph" "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad_22.gph" 
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad.gph", replace
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\fac_tod_edad.png", as(png) replace

*Figura 3
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
graph box edad, over(fac2,label(angle(65))) subtitle((2010)) graphregion(color(teal))
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad1.gph", replace
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad1.png", as(png) replace

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
graph box edad, over(fac5,label(angle(65))) subtitle((2015)) graphregion(color(teal)) ytitle("")
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad2.gph", replace
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad2.png", as(png) replace

graph combine "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad1.gph" "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad2.gph", title("Distribución de Edades de ingreso por Servicios del Área")  graphregion(color(teal))
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad.gph", replace
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\nueva_fac_tod_edad.png", height(1000) width(1500) replace

*Cuadro 2
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2011.do"
tab proc_reg

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2012.do"
tab proc_reg

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2013.do"
tab proc_reg

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2014.do"
tab proc_reg

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
tab proc_reg

*Cuadro 3
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2011.do"
tab NBI2 fac3 if interior==0, col nofreq

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2012.do"
tab NBI2 fac3 if interior==0, col nofreq

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2013.do"
tab NBI2 fac3 if interior==0, col nofreq

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2014.do"
tab NBI2 fac3 if interior==0, col nofreq

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
tab NBI2 fac3 if interior==0, col nofreq

*Cuadro 6
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2011.do"
*tab tipo_hogar fac2
tabout tipo_hogar fac2 using "cuadro6.tex", cell(col) style(tex) replace

*Cuadro 7
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
*tab tipo_hogar fac5
tabout tipo_hogar fac5 using "cuadro7.tex", cell(col) style(tex) replace

*Cuadro 8
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
tab proc_maxpedu

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2011.do"
tab proc_maxpedu

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2012.do"
tab proc_maxpedu 

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2013.do"
tab proc_maxpedu 

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2014.do"
tab proc_maxpedu 

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
tab proc_maxpedu 

*Cuadro 9
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
*tab ocup_pad fac2, col nofreq
tabout ocup_pad fac2 using "cuadro9.tex", cell(col) style(tex) replace

*Cuadro 10
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
*tab nocup_pad fac2, col nofreq
tabout nocup_pad fac5 using "cuadro10.tex", cell(col) style(tex) replace

*Cuadro 11
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
*tab ocup_mad fac2, col nofreq
tabout ocup_mad fac2 using "cuadro11.tex", cell(col) style(tex) replace

*Cuadro 12
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
*tab nocup_mad fac5, col nofreq
tabout nocup_mad fac5 using "cuadro12.tex", cell(col) style(tex) replace

*Figura 5
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2011.do"
graph bar (count) hora_tra2, percentages over(hora_tra) over(fac2,label(angle(45)))  asyvars stack ytitle(% del Total de Inscriptos que trabajan) title("Horas Trabajadas", size(Huge)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura5.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura5.gph", replace

*Figura 6
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
preserve
keep if hora_tra!=0 & hora_tra2!=0
graph bar (count) hora_tra2, percentages over(hora_tra) over(fac5,label(angle(45)))  asyvars stack ytitle(% del Total de Inscriptos que trabajan) title("Horas Trabajadas", size(medsmall)) graphregion(color(teal))
restore, not
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura6.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura6.gph", replace

*Cuadro 13
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2011.do"
*tab rel_trab fac2
tabout rel_trab fac2 using "cuadro13.tex", cell(col) style(tex) replace

*Cuadro 14
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
*tab rel_trab fac2 if rel_trab!=0
tabout rel_trab fac5 using "cuadro14.tex" if rel_trab!=0, cell(col) style(tex) replace

*Cuadro 15
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
tab sec_6 fac2, col nofreq
tabout sec_6 fac2 using "cuadro15.tex", cell(col) style(tex) replace

*Cuadro 16
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
tab secund6 fac5, col nofreq
tabout secund6 fac5 using "cuadro16.tex", cell(col) style(tex) replace

*Cuadro 17
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2012.do"
foreach x of numlist 4 5 12 16 23 300 500 25000{
sum becas if fac4==`x'
return list
scalar anio12`x'=r(mean)
	}

matrix define anio12=(anio124,anio125,anio1212,anio1216,anio1223,anio12300,anio12500,anio1225000)

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2013.do"
foreach x of numlist 4 5 12 16 23 300 500 25000{
sum beca if fac4==`x'
return list
scalar anio13`x'=r(mean)
	}

matrix define anio13=(anio134,anio135,anio1312,anio1316,anio1323,anio13300,anio13500,anio1325000)

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2014.do"
foreach x of numlist 4 5 12 16 23 300 500 25000{
sum beca if fac4==`x'
return list
scalar anio14`x'=r(mean)
	}

matrix define anio14=(anio134,anio135,anio1312,anio1316,anio1323,anio13300,anio13500,anio1325000)

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2014.do"
foreach x of numlist 4 5 12 16 23 300 500 25000{
sum beca if fac4==`x'
return list
scalar anio14`x'=r(mean)
	}

matrix define anio14=(anio144,anio145,anio1412,anio1416,anio1423,anio14300,anio14500,anio1425000)

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
foreach x of numlist 4 5 12 16 23 300 500 25000{
sum beca if fac4==`x'
return list
scalar anio15`x'=r(mean)
	}

matrix define anio15=(anio154,anio155,anio1512,anio1516,anio1523,anio15300,anio15500,anio1525000)

mat define becas=(anio12\anio13\anio14\anio15)
mata : st_matrix("Porcentajes",mean(st_matrix("becas")))
mata : st_matrix("SD",transposeonly(sqrt(diagonal(variance(st_matrix("becas"))))))
mat define becas_percent=(Porcentajes*100\SD*100)

*Figura 7
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
 graph bar (mean) ins_otr1_0 ins_otr1_1 ins_otr1_2 ins_otr1_3 ins_otr1_4 ins_otr1_5 ins_otr1_6 ins_otr1_7 ins_otr1_8, over(fac2,label(angle(45))) nomissing cw legend(order(1 "No cursa/cursó" 2 "UdelaR" 3 "UCUDAL" 4 "UM" 5 "ORT" 6 "UdE" 7 "Otra Privada" 8 "No Univ. Pública" 9 "No Univ. Privada") cols(3) colgap(3)) ytitle(% del Total de Inscriptos, margin(vlarge)) subtitle("2010", size(medsmall)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7_1.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7_1.gph", replace

do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
 graph bar (mean) ins_otr1_0 ins_otr1_1 ins_otr1_2 ins_otr1_3 ins_otr1_4 ins_otr1_5 ins_otr1_6 ins_otr1_7 ins_otr1_8, over(fac5,label(angle(45))) nomissing cw legend(order(1 "No cursa/cursó" 2 "UdelaR" 3 "UCUDAL" 4 "UM" 5 "ORT" 6 "UdE" 7 "Otra Privada" 8 "No Univ. Pública" 9 "No Univ. Privada") cols(3)) subtitle("2015", size(medsmall)) graphregion(color(teal))
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7_2.png", as(png) replace
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7_2.gph", replace

graph combine "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7_1.gph" "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7_2.gph", title("Ingresos a Servicios del Área según Procedencia Universitaria")  graphregion(color(teal)) scale(1)
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7.gph", replace
*graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7.png", height(1280) width(720) replace 
graph export	"C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura7.png",	height(720) width(3000) replace

*Figura 8
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2010.do"
replace obt_tit1=0 if obt_tit1==2
graph bar (mean) obt_tit1 if obt_tit1!=. & ins_otr1_1==1, over(fac2,label(angle(45))) stack bargap(0) nomissing graphregion(color(teal)) subtitle("2010", size(medsmall)) ytitle(% del Total de Inscriptos Provenientes, margin(vsmall))
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8_1.gph", replace
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8_1.png", as(png) replace



do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
 graph bar (mean) obt_tit1 if obt_tit1!=. & ins_otr1_1==1, over(fac5,label(angle(45))) stack bargap(0) graphregion(color(teal)) subtitle("2015", size(medsmall)) ytitle("")
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8_2.gph", replace
graph export "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8_2.png", as(png) replace

graph combine "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8_1.gph" "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8_2.gph", title("Ingresos a Servicios Provenientes de otra carrera de la UdelaR")  graphregion(color(teal)) scale(1)
graph save Graph "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8.gph", replace
graph export	"C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\Imagenes\figura8.png",	height(720) width(3000) replace

*Cuadro 23
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
tabout idcarr fac5 using "cuadro23.tex", replace style(tex)



/*
do "C:\Users\Administrativo\Documents\Mathias\Informes\Segundo Informe Ingresos\datos y scripts\2015.do"
g fac5_n8=.
foreach j in 4 5 12 16 23 300 500 25001 25002 25003 25004{
tab obt_tit1 if fac5==`j' & obt_tit1!=. & ins_otr1_1==1
	return list
	global fac`j'15=r(N)
	replace fac5_n8=r(N) if fac5==`j' & obt_tit1!=. & ins_otr1_1==1
}
graph bar (mean) obt_tit1 if obt_tit1!=. & ins_otr1_1==1, over(fac5, relabel(1 "FCEA" 2 "FDER" 3 "FHUCE" 4 "ENBA" 5 "FCS" 6 "EUMUS" 7 "FIC" 8 "RN" 9 "CURE" 10 "CUT" 11 "CUP") label(angle(45))) bargap(20) nomissing graphregion(color(teal)) subtitle("2015", size(medsmall)) nofill


/*
