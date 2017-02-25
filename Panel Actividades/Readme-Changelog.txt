#####################################################################################
#########Panel de actividades estudiantiles Area Social y Artística 1985-2015########
#####################################################################################


#######Introduccion

Este repositorio guarda las sintaxis e instrucciones para el compilado y actualizado de la base de datos del Panel de actividades estudiantiles Area Social y Artística 1985-2015-UdelaR.

El procedimiento está programado en el software estadístico R*.

NINGUNA BASE DE DATOS SERÁ ALOJADA EN ESTE REPOSITORIO. El cometido del mismo es el de compartir y colaborar 
con el procedimiento utilizado para el compilado y armado de esta base de datos.

Por cualquier consulta dirigirse a mathias.silva@asa.edu.uy


*R Core Team (2016). R: A language and environment for statistical
  computing. R Foundation for Statistical Computing, Vienna, Austria.
  URL https://www.R-project.org/.

#######Detalles

El script 'Filtrado y pegado actividad egreso genactual.r' toma como insumo las bases convertidas (i.e., la resultante de correr el conversor de la carpeta 'Conversores' con el nombre correspondiente sobre la salida .LST de la consulta cruda) correspondientes a las consultas a medida 'g_genactual', 'g_actividades_de_una_gen', 'g_egre_anio',y 'g_carcic' del Sistema de Gestión de Bedelías de la Universidad de la República para un año y Servicio, y devuelve una base de actividades de los estudiantes correspondientes que integra además información sobre sus egresos en el Servicio.

El script 'ejemplo script fusionador.r' es un primer procedimiento para fusionar en una misma base de datos muchas bases resultantes de 'Filtrado y pegado actividad egreso genactual.r' para un Servicio y varios años.

El script 'fusionador area.r' es el procedimiento para pegar verticalmente las 7 bases del período 1985-2015 de los Servicios del Área Social y Artística en una única base.

El 'Panel de actividades estudiantiles Area Social y Artística 1985-2015' es la base resultante de:
1) Correr 'Filtrado y pegado actividad egreso genactual.r' para los 7 Servicios del Área Social y Artística para los años 1985 a 2015 inclusive.
2) Correr 'ejemplo script fusionador.r' para cada uno de los Servicios de forma de tener una base para todo el período por Servicio
3) Correr 'fusionador area.r' para pegar verticalmente estas 7 bases.

########Registro de cambios (changelog)

#Versión inicial aún no lanzada

#####################################################################################
    Panel de actividades estudiantiles Area Social y Artística 1985-2015
    Copyright (C) 2017 Mathias Silva

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#####################################################################################
































