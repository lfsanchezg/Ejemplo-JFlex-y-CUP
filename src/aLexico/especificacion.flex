// imports de java
package aLexico;
%%
//opciones de jflex
%unicode
%integer
%public
%line
%column

%init{
    // inicialización de variables
%init}

%{
    //declaración de variables
    //métodos a ocupar
    public void consola(String s){
        System.out.println(s);
    }
%}

// declaración de macros

numero          = [0-9]+
operador        = "+" | "-" | "*" | "/"
nuevaLinea      = "\n" | "\r"


%%

// declaración de acciones léxicas

{numero}    {
                consola("encontré el número " + yytext() + " en la posición " + (yyline + 1) + "," + (yycolumn + 1));
            }

{operador}  {
                consola("encontré el operador " + yytext() + " en la posición " + (yyline + 1) + "," + (yycolumn + 1));
            }
{nuevaLinea}{
                //no haga nada
            }
.           {
                consola("Error: lexema <" + yytext() + "> no reconocido por el analizador.");
            }