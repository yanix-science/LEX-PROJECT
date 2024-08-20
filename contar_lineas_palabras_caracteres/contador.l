%{
#include <stdio.h>

int line_count = 0;  // Contador de líneas
int word_count = 0;  // Contador de palabras
int char_count = 0;  // Contador de caracteres
%}

%%
\n                  { line_count++; char_count++; }
[ \t]+              { /* Ignorar espacios y tabulaciones */ }
[A-Za-záéíóúÁÉÍÓÚñÑ]+ { word_count++; char_count += yyleng; } // Ajustado para incluir caracteres acentuados y ñ
.                   { char_count++; }
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

    printf("Líneas: %d\n", line_count);
    printf("Palabras: %d\n", word_count);
    printf("Caracteres: %d\n", char_count);

    return 0;
}
