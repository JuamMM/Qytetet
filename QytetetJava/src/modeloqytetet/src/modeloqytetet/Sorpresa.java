/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloqytetet;

/**
 *
 * @author joseng2709
 */
public class Sorpresa {
    private String texto;
    private TipoSorpresa tipo;
    private int valor;
    
    public Sorpresa (String texto ,int valor ,TipoSorpresa tipo){
        this.texto=texto;
        this.valor=valor;
        this.tipo=tipo;
    }
    
    int getValor(){
        return valor;
    }
    
    TipoSorpresa getTipoSorpresa(){
        return tipo;
    }
    
    String getTexto(){
        return texto;
    }
    
    @Override
    public String toString() {
        return "Sorpresa{" + "texto=" + texto + ", valor=" + 
        Integer.toString(valor) + ", tipo=" + tipo + "}"+"\n";
    } 
    
    
}
