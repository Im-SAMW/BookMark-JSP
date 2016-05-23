package com.sam.model;

/**
 *
 * @author sam
 */
public class User {
    private Integer uid;
    private String uname;
    private String upass;
    private String uemail;
    private Integer uadmin;
    
    public User(){    
    }
    
    public void setUid(Integer uid){
        this.uid = uid;
    }
    
    public void setUname(String uname){
        this.uname = uname;
    }
    
    public void setUpass(String upass){
        this.upass = upass;
    }
    
    public void setUemail(String uemail){
        this.uemail = uemail;
    }
    
    public void setUadmin(Integer uadmin){
        this.uadmin = uadmin;
    }
    
    public Integer getUid(){
        return uid;
    }
    
    public String getUname(){
        return uname;
    }
    
    public String getUpass(){
        return upass;
    }
    
    public String getUemail(){
        return uemail;
    }
    
    public Integer getUadmin(){
        return uadmin;
    }
}
