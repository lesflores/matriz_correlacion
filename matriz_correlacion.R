#--------------------
# Matriz de correlación - Pearson
# Ejemplo ilustrativo
# Datos para ejemplificar Matriz de correlación de criminalidad y gobernanza
#--------------------

library(tidyverse)
library(readxl)
library(ggcorrplot)

datos <- read_excel("datos_regresion.xlsx")

glimpse(datos)

# calcular la matriz de correlación

corr_datos <- datos %>% select(anio, homicidio_doloso, homicidio_culposo,
                               secuestro, extorsion, robo_violencia, 
                               robo_vehiculo, robo_casa, robo_negocio,
                               robo_transeunte, violacion, lesiones_dolosas,
                               feminicidio, dem_poliarquia) %>% # feminicidio: imputación por la media
  cor(use ="pairwise") %>% round(1)

ggcorrplot(corr_datos,type="lower",lab=T,show.legend=T) #upper

