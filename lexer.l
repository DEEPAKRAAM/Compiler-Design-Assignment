%{
#include <stdio.h>
%}

%%

[0-9]+          { printf("Integer: %s\n", yytext); }
[+-]?[0-9]+\.[0-9]+   { printf("Floating Point: %s\n", yytext); }
[a-zA-Z]+       { printf("Identifier: %s\n", yytext); }
[ \t\n]         ; // Ignore whitespace and newline characters
.               { printf("Invalid Token: %s\n", yytext); }

%%

int main(int argc, char* argv[]) {
    yyin = fopen(argv[1], "r"); // Open the input file
    if (yyin == NULL) {
        fprintf(stderr, "Error: Cannot open input file.\n");
        return 1;
    }
    
    yylex(); // Begin lexical analysis
    
    fclose(yyin); // Close the input file
    return 0;
}

