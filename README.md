Integrantes:

- Bryan Ariza
- Andres Toledo
- Juan Wilches
- Manuel Cardenas

Descripción del Proyecto:
Este proyecto contiene cinco programas desarrollados en LEX para realizar diversas tareas relacionadas con el procesamiento de texto y el reconocimiento de tokens. 
Cada programa cumple con un conjunto específico de requisitos y es capaz de manejar diferentes tipos de entrada.

Instrucciones de Ejecución
1. Abrir Terminal
2. Clonar el repositorio con los siguientes comandos:
   
        git clone https://github.com/yanix-science/LEX-PROJECT.git
        cd LEX-PROJECT
  
4. Instalar Flex & Bison (Si es necesario):
   
       sudo apt-get install flex
       sudo apt-get install bison

5. Compilar y ejecutar los programas:

Para compilar y ejecutar cualquiera de los programas, sigue estos pasos:

  4.1 Navega al directorio correspondiente del programa deseado.

  4.2 Usa Flex para compilar el archivo .l de esta manera:
  
      flex nombre_del_archivo.l
  Luego, compila el código generado con GCC:

      gcc lex.yy.c -o nombre_del_programa -ll
  Finalmente, ejecuta el programa:

      ./nombre_del_programa archivo_de_entrada.txt

EJEMPLO:
Ejemplo: Programa 1 - Contar Líneas, Palabras y Caracteres
Este programa cuenta el número de líneas, palabras y caracteres en un archivo de texto.

Instrucciones:

Navega al directorio contar_lineas_palabras_caracteres:

        cd contar_lineas_palabras_caracteres
        
Compila el programa usando Flex:

        flex contador.l
        gcc lex.yy.c -o count -ll

Ejecuta el programa con un archivo de texto de entrada:

        ./count ejemplo1.txt
Salida esperada:

        Líneas: 6
        Palabras: 18
        Caracteres: 109

Nota: Asegúrate de reemplazar ejemplo1.txt con el nombre de archivo de entrada disponible en cada subdirectorio.
























