clear all
input anio hom_edad muj_edad prom_edad_h_bajo prom_edad_h_alto prom_edad_m_bajo prom_edad_m_alto median_edad_h median_edad_m
2010 2832 5320 24.13 24.65 24.41 24.82 22 22
2011 2786 5367 22.97 23.51 23.21 23.62 21 20
2012 2805 5350 23.01 23.53 23.16 23.54 21 21
2013 2973 5477 23.22 23.75 23.39 23.79 21 21
2014 3043 5532  23.12 23.65 23.49 23.90 21 20
end

 tsset anio

twoway (tsline hom_edad, recast(connected) msymbol(diamond) mlabel(hom_edad) mlabsize(large) mlabposition(12)) (tsline muj_edad, recast(connected) msymbol(diamond) mlabel(muj_edad) mlabsize(large) mlabposition(12))
