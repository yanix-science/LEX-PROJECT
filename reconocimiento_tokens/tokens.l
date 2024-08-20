%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[0-9]+      { printf("NUMBER: %s\n", yytext); }
"+"         { printf("ADD: %s\n", yytext); }
"-"         { printf("SUB: %s\n", yytext); }
"*"         { printf("MUL: %s\n", yytext); }
"/"         { printf("DIV: %s\n", yytext); }
"abs"       { printf("ABS: %s\n", yytext); }
\n          { printf("EOL\n"); }
[ \t]+      { /* Ignorar espacios y tabulaciones */ }
.           { printf("UNKNOWN TOKEN: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("fopen");
        return 1;
    }

    yyin = file;
    yylex();
    fclose(file);
    return 0;
}

int yywrap() {
    return 1;
}
