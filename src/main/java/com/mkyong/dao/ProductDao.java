package com.mkyong.dao;

import com.mkyong.model.Product;

import java.util.List;

/**
 * Created by Alexey on 20.01.2017.
 */
public interface ProductDao {

    Product sortBy(String name);
    Product findById(int id);
    void removeProduct(int id);
    List<Product> findAll();
    void addProduct(Product product);
    void editProduct(Product product);
}
