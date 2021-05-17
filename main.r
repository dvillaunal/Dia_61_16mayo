## ------------------------------------------------------------------------------
"Protocolo:

 1. Daniel Felipe Villa Rengifo

 2. Lenguaje: R

 3. Tema: Funciones built-in in R con cadenas de texto  (realice al menos dos ejercicios que requieran cargar archivos externos *.csv cada uno con al menos 50 filas y tres datos por fila, lea y procese la información del archvo leído, y guarde las respuestas a los ejercicios  en archivos independientes tipo *.txt)

 4. Fuentes:
    https://www.generatedata.com"


## ------------------------------------------------------------------------------
#Importamos la base de datos:
base1 <- read.csv(file = "Base1.csv", header = T, sep = ",", dec = ".")

## Vamos a covertir las dos ultimas columnas en factores:
base1$Departamento <- as.factor(base1$Departamento)

base1$arroa <- as.factor(base1$arroa)

## Vamos a crear un vector con la caracteristica: Nombre_Departamento:

Nombre_Dep <- as.vector(with(base1, paste(Nombre,Departamento, sep = "_")))

## Ahora añadimos a ese vector le añadimos el arroa....
correo <- as.vector(paste(Nombre_Dep, base1$arroa, sep = ""))

## Vemaos las direcciones de correo electronico:
for (i in correo) {
  cat("\n",i,"\n")
}

## Ahora añadimos un poco de texto:

su_correo <- as.vector(paste("Su Correo Electronico es:", correo))

for (i in su_correo) {
  cat("\n",i,"\n")
}

su_correo <- data.frame(
  "Correo_Electronico"=su_correo
)

# Exportamos el vector:
write.table(su_correo, file = "CorreoElectronico.txt", row.names = F)


## ------------------------------------------------------------------------------
# Cargamos la base de datos:
base2 <- read.csv(file = "Base2.csv", sep = ",", header = T)

#Convertimos en factores las dos ultimas columnas
base2$Productoras <- as.factor(base2$Productoras)

base2$Banco <- as.factor(base2$Banco)


## ------------------------------------------------------------------------------
# Vamos a dar un ejejmplo del texto a generear y exportar:
cat("\n\"Nombre\" trabaja en \"Productora\", donde le consignan en \"Banco\"")


## ------------------------------------------------------------------------------
# Cambiemos los datos, pero antes debemos recordar que cambiar factoes, antes se deben agregar a los levels

levels(base2$Banco) <- sub("Colpatria","Colpatria&Scotiabanck", levels(base2$Banco))

levels(base2$Banco) <- sub("WWB", "BancoW", levels(base2$Banco))

levels(base2$Banco)

## Ahora podemos cambiar los valores:
base2$Productoras <- sub("Fox", "Disney", base2$Productoras)

base2$Productoras <- sub("HBO", "Disney", base2$Productoras)

base2$Productoras <- sub("Marvel", "Disney", base2$Productoras)

##Una vez cambiado todo creamos el texto y exportamos:
texto <- as.vector(paste(base2$Nombres,
                         "Trabaja en",
                         base2$Productoras,
                         ", donde le consignan en",
                         base2$Banco))

## Exportemos:
texto <- data.frame(
  "Bancos de Productoras" = texto
)

write.table(texto, file = "BancosProductoras.txt", row.names = F)


