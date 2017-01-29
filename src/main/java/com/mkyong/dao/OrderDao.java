package com.mkyong.dao;


import com.mkyong.model.Order;

import java.util.List;

/**
 * Created by Alexey on 20.01.2017.
 */
public interface OrderDao {

    List<Order> findAll();

    void addOrder(Order order);
}
