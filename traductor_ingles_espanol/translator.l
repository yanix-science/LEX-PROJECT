%{
#include <stdio.h>
#include <string.h>

// Definición de las palabras y sus traducciones
typedef struct {
    char *english;
    char *spanish;
} Translation;

Translation dictionary[] = {
    {"hello", "hola"},
    {"world", "mundo"},
    {"cat", "gato"},
    {"dog", "perro"},
    {"house", "casa"},
    {"book", "libro"},
    {"car", "coche"},
    {"food", "comida"},
    {"friend", "amigo"},
    {"school", "escuela"}
};

#define DICTIONARY_SIZE (sizeof(dictionary) / sizeof(dictionary[0]))

// Función para traducir una palabra
const char *translate(const char *word) {
    for (int i = 0; i < DICTIONARY_SIZE; i++) {
        if (strcmp(dictionary[i].english, word) == 0) {
            return dictionary[i].spanish;
        }
    }
    return word;  // Si no se encuentra la traducción, se devuelve la palabra original
}
%}

%%
[a-zA-Z]+ {
    // Se traduce la palabra si está en el diccionario
    const char *translated = translate(yytext);
    printf("%s ", translated);
}
[ \t\n]+ {
    // Imprime espacios, tabulaciones y saltos de línea
    printf("%s", yytext);
}
. {
    // Imprime caracteres no alfabéticos (puede ser puntuación, etc.)
    putchar(yytext[0]);
}
%%

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = file;
    yylex();
    fclose(file);

    return 0;
}
