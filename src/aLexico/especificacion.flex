// imports de java
package aLexico;
import aSintactico.sym;
import DatosExtra.*;
%%
//opciones de jflex
%unicode
%integer
%public
%line
%column
%cup

%init{
    // inicialización de variables
%init}

%{
    //declaración de variables
    //métodos a ocupar
    public void consola(String s){
        System.out.println(s);
    }
    public java_cup.runtime.Symbol simbolo(int id){
        consola("detectado " + yytext() + "," + yyline + "," +yycolumn );
        
        // el constructor de Symbol acepta un segundo argumento que puede ser
        // cualquier objeto, se ocupa DatosExtra para pasar el lexema y su posición
        return new java_cup.runtime.Symbol(id, new DatosExtra(yytext(), yyline, yycolumn));
    } 
%}

// declaración de macros

numero          = [0-9]+
suma            = "+"
resta		= "-"
multiplicacion	= "*"
division	= "/"
nuevaLinea      = "\n" | "\r"


%%

// declaración de acciones léxicas

{numero}        {
                return simbolo(aSintactico.sym.NUMERO);
                }
{suma}          {
		return simbolo(aSintactico.sym.SUMA);
                }
{resta}		{
		return simbolo(aSintactico.sym.RESTA);
                }
{multiplicacion}	{
		return simbolo(aSintactico.sym.MULT);
                }
{division}	{
		return simbolo(aSintactico.sym.DIVISION);
                }
//acciones vacías aceptan la entrada sin realizar acciones, si no se incluyen, el analizador reportará un error
{nuevaLinea} {
                //no haga nada
            }
" "         {
                //no haga nada
            }
.           {
                consola("Error: lexema <" + yytext() + "> no reconocido por el analizador.");
            }