clear all
input anio fcea_h fcea_m fder_h fder_m fhuce_h fhuce_m enba_h enba_m fcs_h fcs_m eubca_h eubca_m eumus_h eumus_m fic_h fic_m eda_h eda_m
2010 869 1183 1034 2509 251 514 191 330 233 664 26 91 74 36 239 370 490 815
2011 930 1240 918 2127 318 812 144 289 211 635 22 70 54 31 236 352 467 916
2012 1098 1529 994 2474 347 661 141 292 177 522 19 62 68 30 221 335 327 631
2013 1180 1533 1059 2467 241 497 138 348 206 563 26 101 76 46 260 385 363 668
2014 1374 1864 1087 2792 314 583 149 366 248 645 16 70 76 22 290 400 . .
end

 tsset anio
 
 twoway (tsline fic_h, recast(connected) msymbol(diamond) mlabel(fic_h) mlabsize(large) mlabposition(12)) (tsline fic_m, recast(connected) msymbol(diamond) mlabel(fic_m) mlabsize(large) mlabposition(12)) 
