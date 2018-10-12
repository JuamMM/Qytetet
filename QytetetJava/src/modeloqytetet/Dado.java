/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloqytetet;

import java.util.Random;
/**
 *
 * @author joseng2709
 */
public class Dado {
    int valor;
    
    public Dado(){
        valor=0;
    }
    
    public int Tirar(){
        Random rand = new Random();
        valor = rand.nextInt(6)+1;
        
        return valor;
    }
    public int getValor(){
        return valor;
    }
}
