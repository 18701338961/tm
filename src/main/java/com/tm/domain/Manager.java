package com.tm.domain;

public class Manager {
    private String id;

    private String managerno;

    private String password;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getManagerno() {
        return managerno;
    }

    public void setManagerno(String managerno) {
        this.managerno = managerno == null ? null : managerno.trim();
    }

    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}
