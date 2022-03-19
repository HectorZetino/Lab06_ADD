
#Para leer los datos, desde el csv, utilice la función 

dataset <-  read.transactions("dataset_MB.csv",sep = ";", format="basket")


#Algoritmo a-priori
#soporte y una confianza, minsup = 0.3  tiene que aparecer en el 30% de las transacciones generadas 
#confmin = 0.5(que tan frecuentes aparecen los itemns consecuentes en antecedentes)

reglas <- apriori(dataset,
                  parameter = list(supp=0.001 , conf = 0.25, maxlen=10 , minlen= 2, target = "rules"))

summary(reglas)
inspect(reglas)


inspect(head(sort(reglas, by = "lift"), 3))

plot(reglas)
plot(reglas, measure = "lift")

#evaluar articulos especificos
#Ejercicio No. 2


BottledBeer <- apriori(dataset,
                  parameter = list(supp=0.001 , conf = 0.25, maxlen = 10,  minlen= 2),
                  appearance =  list(lhs="bottled beer",default = "rhs"))

Liquor <- apriori(dataset,
                       parameter = list(supp=0.001 , conf = 0.25, maxlen = 10,  minlen= 2),
                       appearance =  list(lhs="liquor",default = "rhs"))


rbwine <- apriori(dataset,
                  parameter = list(supp=0.001 , conf = 0.25, maxlen = 10,  minlen= 2),
                  appearance =  list(lhs="red/blush wine",default = "rhs"))

subrules <- head(reglas, n=3, by="lift")
plot(subrules, method = "graph", engine = "htmlwidget")
