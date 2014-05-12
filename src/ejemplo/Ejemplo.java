/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejemplo;

import aLexico.Yylex;
import aSintactico.parser;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                parser p = new parser(lexer);
                p.parse();
                
        } catch (IOException ex) {
            System.out.println("Error: No se puede acceder al archivo" );
        } catch (Exception ex) {
            Logger.getLogger(Ejemplo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
