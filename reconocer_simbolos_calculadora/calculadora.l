%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+\.[0-9]+    { printf("Número decimal: %s\n", yytext); }
[0-9]+            { printf("Número entero: %s\n", yytext); }
\+                { printf("Símbolo de adición: %s\n", yytext); }
\-                { printf("Símbolo de sustracción: %s\n", yytext); }
\*                { printf("Símbolo de multiplicación: %s\n", yytext); }
\/                { printf("Símbolo de división: %s\n", yytext); }
\=                { printf("Símbolo de igualdad: %s\n", yytext); }
\(                { printf("Paréntesis izquierdo: %s\n", yytext); }
\)                { printf("Paréntesis derecho: %s\n", yytext); }
[ \t\n]+          { /* Ignorar espacios, tabulaciones y saltos de línea */ }
.                 { printf("Caracter no reconocido: %s\n", yytext); }
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
