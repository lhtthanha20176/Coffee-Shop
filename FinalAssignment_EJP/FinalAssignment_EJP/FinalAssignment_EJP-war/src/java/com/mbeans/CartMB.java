/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mbeans;

import javax.inject.Named;
import javax.enterprise.context.RequestScoped;


@Named(value = "cartMB")
@RequestScoped
public class CartMB {

    /**
     * Creates a new instance of CartMB
     */
    public CartMB() {
    }
    
}
