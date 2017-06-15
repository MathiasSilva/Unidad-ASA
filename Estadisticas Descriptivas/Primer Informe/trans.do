clear all
cd "D:\Facultad\Mesareasocial\Ingresos 2010_2014\Primer Informe\Mapa\URY_adm"
use trans, clear
merge 1:1 id using uydb
spmap f11 using uycoord, id(id) fcolor(Blues)


