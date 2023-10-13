%{
#include <stdio.h>
#include <string.h>
%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { printf("Keyword: %s\n", yytext); }
[0-9]+ { printf("Number: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[+\-*/=(){};,<>&|!%] { printf("Operator: %s\n", yytext); }
[ \t\n] ; // Ignore whitespace and newline characters
. { printf("Invalid Token: %s\n", yytext); }

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* inputFile = fopen(argv[1], "r");
    if (inputFile == NULL) {
        fprintf(stderr, "Error: Cannot open input file.\n");
        return 1;
    }

    yyin = inputFile;
    yylex();
    fclose(inputFile);

    return 0;
}

