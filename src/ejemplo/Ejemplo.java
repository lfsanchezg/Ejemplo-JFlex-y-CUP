/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejemplo;

import aLexico.Yylex;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author felipe
 */
public class Ejemplo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
                Yylex lexer = new Yylex(new FileReader("entradaBuena.txt"));
                lexer.yylex();
                lexer.yyclose();
                
        } catch (IOException ex) {
            System.out.println("Error: No se puede acceder al archivo" );
        }
    }
    
}
