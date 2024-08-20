%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void clasificar_numero(char* numero);
%}

DIGITO      [0-9]
ENTERO      [-+]?{DIGITO}+
DECIMAL     {ENTERO}\.{DIGITO}+
NUMERO      {ENTERO}|{DECIMAL}
IMAGINARIO  [ij]
ANGULO      (pi|PI|π)
SIGNO       [+-]

%%

^{NUMERO}{IMAGINARIO}$                 { clasificar_numero(yytext); }
^[-+]?{IMAGINARIO}$                    { clasificar_numero(yytext); }
^{NUMERO}$                             { clasificar_numero(yytext); }
^{NUMERO}{SIGNO}{NUMERO}?{IMAGINARIO}$ { clasificar_numero(yytext); }
^{NUMERO}"<"{NUMERO}({ANGULO})?">"$    { clasificar_numero(yytext); }
.|\n                                   { /* Ignorar otros caracteres */ }

%%

void clasificar_numero(char* numero) {
    int tiene_parte_real = 0;
    int tiene_parte_imaginaria = 0;
    int es_forma_polar = 0;
    char* ptr = numero;
    int es_imaginario_puro = 0;

    if (strchr(numero, '<') && strchr(numero, '>')) {
        es_forma_polar = 1;
    }

    // Verifica si el número tiene parte imaginaria
    if (strchr(numero, 'i') || strchr(numero, 'j')) {
        tiene_parte_imaginaria = 1;
    }

    // Si solo tiene parte imaginaria y no hay parte real explícita
    if ((strchr(numero, 'i') || strchr(numero, 'j')) && !strpbrk(numero, "0123456789")) {
        es_imaginario_puro = 1;
    }

    // Detectar parte real
    while (*ptr) {
        if ((*ptr >= '0' && *ptr <= '9') || *ptr == '.') {
            // Verificar si es seguido por un símbolo imaginario o fin de cadena
            if (*(ptr + 1) != 'i' && *(ptr + 1) != 'j' && *(ptr + 1) != '<') {
                tiene_parte_real = 1;
                break;
            }
        }
        ptr++;
    }

    // Clasificación
    printf("Número: %s\n", numero);
    if (es_forma_polar) {
        printf("Clasificación: Complejo (forma polar)\n");
    } else if (es_imaginario_puro) {
        printf("Clasificación: Imaginario puro\n");
    } else if (tiene_parte_real && tiene_parte_imaginaria) {
        printf("Clasificación: Complejo\n");
    } else if (tiene_parte_real) {
        printf("Clasificación: Real\n");
    } else if (tiene_parte_imaginaria) {
        printf("Clasificación: Imaginario puro\n");
    }
    printf("\n");
}

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
