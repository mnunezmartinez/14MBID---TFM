# Cargar las librerías necesarias
library(edgeR)

# 1. Cargar el dataset
dataset <- read.table("C:/Users/mnunezmartinez_viu/Documents/14MBID---TFM/data/raw/miRNA_RCadj.txt", sep = "\t", header = TRUE)


# 2. Convertir todos los datos a formato numérico
# Convertimos todas las columnas a numérico, excepto la primera columna 'name'
dataset_numeric <- dataset
dataset_numeric[,-1] <- lapply(dataset_numeric[,-1], as.numeric)

# Imprimir las primeras filas y columnas del dataset para verificar la importación
cat("Vista previa del dataset después de la conversión a formato numérico:\n")
print(head(dataset_numeric, 10))  # Imprime las primeras 10 filas del dataset
cat("\nDimensiones del dataset después de la conversión: ", dim(dataset_numeric), "\n")


# 3. Verificar y eliminar columnas y filas con todos los valores en cero

# Identificar columnas con todos los valores en cero
# La columna `name` no debe ser incluida en la verificación de ceros
zero_columns <- colSums(dataset_numeric[] == 0) == nrow(dataset_numeric)

# Imprimir el número de columnas que son completamente cero
cat("Número de columnas que son completamente cero: ", sum(zero_columns), "\n")

# Eliminar columnas con todos los valores en cero
dataset_numeric <- dataset_numeric[, !zero_columns]

# Identificar filas con todos los valores en cero
# La columna `name` no debe ser incluida en la verificación de ceros
zero_rows <- rowSums(dataset_numeric[] == 0) == ncol(dataset_numeric[])

# Imprimir el número de filas que son completamente cero
cat("Número de filas que son completamente cero: ", sum(zero_rows), "\n")

# Eliminar filas con todos los valores en cero
dataset_numeric <- dataset_numeric[!zero_rows, ]

# Verificar el número de filas y columnas después de la eliminación
cat("Número de filas después de la eliminación: ", nrow(dataset_numeric), "\n")
cat("Número de columnas después de la eliminación: ", ncol(dataset_numeric), "\n")


# 4. Eliminar los miRNA con recuento de expresión igual a 0 en un 60% o más de las muestras
# Definimos el umbral para eliminar filas
threshold <- 0.6 * ncol(dataset_numeric[,-1])  # Porcentaje de muestras

# Calculamos el número de muestras con recuento 0 por cada miRNA
zero_counts <- rowSums(dataset_numeric[,-1] == 0)

# Filtramos las filas según el umbral
dataset_filtered <- dataset_numeric[zero_counts < threshold,]


# 5. Verificar y eliminar filas y columnas con todos los valores en cero
# Eliminamos columnas con todos los valores en cero
dataset_filtered <- dataset_filtered[, colSums(dataset_filtered[] == 0) < nrow(dataset_filtered)]

# Eliminamos filas con todos los valores en cero
dataset_filtered <- dataset_filtered[rowSums(dataset_filtered[] == 0) < ncol(dataset_filtered[]),]

# Verificar el número de filas y columnas después de la limpieza
cat("Número de filas después de la eliminación: ", nrow(dataset_filtered), "\n")
cat("Número de columnas después de la eliminación: ", ncol(dataset_filtered), "\n")


# 6. Normalizar el dataset con TMM usando la librería edgeR
# Extraemos la matriz de cuenta y los nombres de miRNA
counts <- as.matrix(dataset_filtered[,-1])
rownames(counts) <- dataset_filtered$name

# Verificar la suma total de cada columna en la matriz de recuentos
col_sums <- colSums(counts)
zero_library_sizes <- col_sums == 0

# Imprimir el número de columnas con suma cero
cat("Número de columnas con suma cero: ", sum(zero_library_sizes), "\n")


# Creación del objeto DGEList
dge <- DGEList(counts=counts)

# Normalización con TMM
dge <- calcNormFactors(dge, method="TMM")

# Obtener los factores de normalización
norm_factors <- dge$samples$norm.factors

# Aplicar los factores de normalización a la matriz de conteos
normalized_counts <- cpm(dge, normalized.lib.sizes = TRUE)

# Guardar el resultado final en un archivo CSV
write.csv(normalized_counts, "C:/Users/mnunezmartinez_viu/Documents/14MBID---TFM/data/processed/miRNA_RCadj_TMM.csv", row.names = TRUE)
