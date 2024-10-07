# 14MBID---TFM

Este proyecto tiene como objetivo la detección de cáncer mediante la aplicación de modelos de clasificación sobre datos de miARNs obtenidos de biopsias líquidas. En la primera fase, se llevó a cabo un análisis exploratorio de datos para garantizar la calidad y el estado de los datos antes de la selección de características. Se revisaron los tipos de datos, se realizó un resumen estadístico, se inspeccionaron valores faltantes y atípicos, y se analizaron los diferentes patrones formados por los datos. Los histogramas y gráficos de densidad mostraron una distribución sesgada; sin embargo, se observó una mejora en la asimetría tras el preprocesamiento y la normalización.

A continuación, se aplicó una selección de características que resultó en la identificación de 145 miARNs relevantes. La evaluación de estos miARNs mostró un buen rendimiento en métricas clave, como la AUC-ROC y el F1-Score, con una destacada consistencia en la precisión y la sensibilidad. Posteriormente, se optimizaron cinco modelos de clasificación: SVM, KNN, XGBoost, Random Forest y MLP. Los resultados indicaron que XGBoost fue el modelo más eficaz, alcanzando una sensibilidad del 98,99 % y un F1-Score de 0,9159, lo que lo hace especialmente adecuado para la detección de cáncer en este contexto clínico.

Por último, se realizó un análisis de la importancia de los miARNs seleccionados, destacando aquellos que resultaron ser más influyentes en la clasificación. Los hallazgos sugieren que los miARNs hsa-miR-185-5p, hsa-miR-378g, hsa-let-7b-5p y hsa-miR-148a-3p son de especial relevancia. Este trabajo resalta el papel de los miARNs como biomarcadores en la detección temprana del cáncer, lo que abre la puerta a futuras investigaciones y aplicaciones clínicas en la oncología.

Palabras clave: miARNs, detección de cáncer, modelos de clasificación, biomarcadores, selección de características.



## Instalación

Instrucciones para instalar y configurar el entorno necesario para ejecutar el proyecto. 

```bash
# Ejemplo de comandos para la instalación
pip install -r requirements.txt
```


## Uso

Una vez que el proyecto esté instalado, puedes usarlo de la siguiente manera:
- Ejecutar el notebook en un entorno python


## Estructura del Proyecto

La estructura del proyecto es la siguiente:


```plaintext
├── data/               # Directorio para datos de entrada y salida
│   ├── raw/            # Datos originales sin procesar
│   ├── processed/      # Datos procesados listos para su análisis
├── notebooks/          # Notebooks de Jupyter para análisis y experimentación
│   ├── TFM_code.ipynb  # Código correspondiente a los apartados del TFM: EDA, preprocesamiento, selección de características, modelado. Está ordenado según el índice.
│   ├── TFM_code_GPU    # Código que debe ejecutarse en entorno con GPU
├── results/            # Resultados y modelos generados
│   ├── models/         # Modelos entrenados
│   └── characteristic/ # Tablas con la importancia de los miARNs
│   └── statistics/     # Tablas con las estadísticas de los miARNs
├── normalize_script.R  # Script para realizar el filtrado y la normalización TMM
├── README.md           # Este archivo
├── requirements.txt    # Lista de dependencias del proyecto
├── malena_nunez_martinez-14MBID_TFM.pdf    # Memoria del proyecto
```


## Dependencias
Especificadas en el archivo [requirements.txt](#requirements.txt)


## Licencia

Este proyecto está licenciado bajo los términos de la [Licencia MIT](LICENSE). Consulta el archivo `LICENSE` para más detalles sobre los términos de la licencia.


## Contacto

Si tienes alguna pregunta o necesitas más información, no dudes en contactarme:

- **Correo electrónico:** [tuemail@example.com](nunezmartinezmalena@gmail.com)
- **LinkedIn:** [Tu Perfil LinkedIn](https://www.linkedin.com/in/malena-nunez-martinez/)

¡Gracias por tu interés en este proyecto!
