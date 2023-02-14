# lenguaje-senas-CNN
SISTEMA DE IDENTIFICACIÓN DE LENGUAJE DE SEÑAS USANDO REDES NEURONALES CONVOLUCIONALES (CNN)

En el diseño se usó una red neuronal multicapa con una capa final de clasificación completamente conectada. La estructura de la red está conformada por una capa de entrada de 200x200x3, 4 capas intermedias y una capa de salida de 24 clasificaciones (26 letras del abecedario ingles, menos la J y Z porque requieren movimientos)
ETAPA DE ENTRENAMIENTO
En la etapa de entrenamiento se utiliza un algoritmo de descenso de gradiente estocástico con impulso (sgdm). Es un método que ayuda a acelerar los vectores de gradientes en las direcciones correctas, lo que conduce a una convergencia más rápida.
Se utilizó una base de datos de la página kaggle. El dataset consta de 3000 fotografías 200x200 por cada letra del abecedario. En total son 72000 imágenes. De este total se tomó el 70% para entrenar y el restante para validar el entrenamiento.

![Screen Shot 2021-08-09 at 11 12 33](https://user-images.githubusercontent.com/67990891/218847064-22bf0d54-66f3-4c0c-a461-5f0f107eb30d.png)

