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
public class TituloPropiedad {
    private String nombre;
    private Boolean hipotecada;
    private int precioCompra;
    private int alquilerBase;
    private float factorRevalorizacion;
    private int hipotecaBase;
    private int precioEdificar;
    private int numHoteles;
    private int numCasas;
    
    public TituloPropiedad(){
        hipotecada = false;
        numHoteles = 0;
        numCasas = 0;
    }
    public TituloPropiedad(String nombre, Boolean hipotecada, int precioCompra, 
            int alquilerBase, float factorRevalorizacion, int hipotecaBase, int precioEdificar,
            int numCasas, int numHoteles){
        this.nombre = nombre;
        this.hipotecada = hipotecada;
        this.precioCompra = precioCompra;
        this.alquilerBase = alquilerBase;
        this.factorRevalorizacion = factorRevalorizacion;
        this.hipotecaBase = hipotecaBase;
        this.precioEdificar = precioEdificar;
        this.numCasas = numCasas;
        this.numHoteles = numHoteles;
    }
    public String getNombre(){
        return nombre;
    }
    public Boolean getHipotecada(){
        return hipotecada;
    }
    public int getPrecioCompra(){
        return precioCompra;
    }
    public int getAlquilerBase(){
        return alquilerBase;
    }
    public float getFactorRevalorizacion(){
        return factorRevalorizacion;
    }
    public int  getHipotecaBase(){
        return  hipotecaBase;
    }
    public int getPrecioEdificar(){
        return precioEdificar;
    }
    public int getNumHoteles(){
        return numHoteles;
    }
    public int getNumCasas(){
        return numCasas;
    }
    public void cambiaHipotecada(){
        hipotecada = !hipotecada;
    }
    public void setTitulo(TituloPropiedad cambia){
        this.nombre = cambia.getNombre();
        this.hipotecada = cambia.getHipotecada();
        this.precioCompra =cambia.getPrecioCompra();
        this.alquilerBase = cambia.getAlquilerBase();
        this.factorRevalorizacion = cambia.getFactorRevalorizacion();
        this.hipotecaBase = cambia.getHipotecaBase();
        this.precioEdificar = cambia.getPrecioEdificar();
        this.numCasas = cambia.getNumCasas();
        this.numCasas = cambia.getNumCasas();
    }
    @Override
    public String toString(){
        String devuelve;
        devuelve = "Nombre: "+ nombre +"\n\n"
                + "Hipotecada: " + Boolean.toString(hipotecada) +"\n\n"
                + "Precio Compra: " + Integer.toString(precioCompra) +"\n\n"
                + "Alquiler base: " + Integer.toString(alquilerBase) + "\n\n"
                + "Factor de Revalorización: " + Float.toString(factorRevalorizacion) + "\n\n"
                + "Hipoteca base: " + Integer.toString(hipotecaBase) +"\n\n"
                + "Precio de Edificar: " + Integer.toString(precioEdificar) +"\n\n"
                + "Número de Casas: " + Integer.toString(numCasas) + "\n\n"
                + "Número de Hoteles: " + Integer.toString(numHoteles) + "\n\n";
        return devuelve;
    }
    
}
