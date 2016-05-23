/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.model;

/**
 *
 * @author sam
 */
public class BookMark {
    private Integer bid;
    private String bname;
    private String burl;
    private String bclass;
    
    public BookMark(){
    }
    public void setBid(Integer bid){
        this.bid = bid;
    }
    
    public void setBname(String bname){
        this.bname = bname;
    }
    
    public void setBurl(String burl){
        this.burl = burl;
    }
    
    public void setBclass(String bclass){
        this.bclass = bclass;
    }
    
    public Integer getBid(){
        return bid;
    }
    
    public String getBname(){
        return bname;
    }
    
    public String getBurl(){
        return burl;
    }
    
    public String getBclass(){
        return bclass;
    }
}
