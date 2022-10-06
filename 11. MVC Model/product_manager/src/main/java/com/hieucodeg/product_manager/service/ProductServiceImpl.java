package com.hieucodeg.product_manager.service;

import com.hieucodeg.product_manager.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1,new Product("May Giat", "Trung Quoc",5000000,"May nhap khau lau"));
        products.put(2,new Product("Ti vi", "Viet Nam",10000000,"Hang qua tay"));
        products.put(3,new Product("Dien thoai", "Han Quoc",7000000,"May rin"));
        products.put(4,new Product("Ban phim", "My",250000,"Ban phim co"));
        products.put(5,new Product("Choi lau nha", "Phap",70000,"Choi dung ben"));
        products.put(6,new Product("May hut bui", "Nga",6000000,"May xin"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
       List<Product> productArrayList = new ArrayList<>();
        for (Product item:products.values()) {
            if (item.getName().toUpperCase().contains(name.toUpperCase())) {
                productArrayList.add(item);
            }
        }
        return productArrayList;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
