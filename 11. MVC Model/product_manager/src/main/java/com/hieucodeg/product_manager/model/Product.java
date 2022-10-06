package com.hieucodeg.product_manager.model;

import java.io.Serializable;
import java.util.Scanner;

public class Product implements Serializable {
    private int id = 0;
    static int count = 0;
    private String name;
    private String manufacture;
    private int price;
    private String describe = "";

    public Product() {
    }

    public Product(String name, String manufacture, int price, String describe) {
        id = ++count;
        this.name = name;
        this.manufacture = manufacture;
        this.price = price;
        this.describe = describe;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManufacture() {
        return manufacture;
    }

    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
