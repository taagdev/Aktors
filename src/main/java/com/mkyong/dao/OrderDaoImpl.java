package com.mkyong.dao;

import com.mkyong.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Alexey on 20.01.2017.
 */
@Repository
public class OrderDaoImpl implements OrderDao {

    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }


    @Override
    public List<Order> findAll() {
        Map<String, Object> params = new HashMap<String, Object>();

        String sql = "SELECT * FROM orders ORDER BY orderingDate, productName";

        List<Order> result = namedParameterJdbcTemplate.query(sql, params, new OrderMapper());

        return result;
    }

    @Override
    public void addOrder(Order order) {
        String sql = "INSERT INTO orders (price, userId, productId, productQuantity) VALUES (:price, :userId, :productId, :productQuantity)";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("price", order.getPrice())
                .addValue("userId", order.getUserId())
                .addValue("productId", order.getProductId())
                .addValue("productQuantity", order.getProductQuantity())
                .addValue("productName", order.getProductName());

        namedParameterJdbcTemplate.update(sql,sqlParameterSource);
    }

    private static final class OrderMapper implements RowMapper<Order> {

        public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setPrice(rs.getDouble("price"));
            order.setProductId(rs.getInt("productId"));
            order.setUserId(rs.getInt("userId"));
            order.setProductQuantity(rs.getInt("productQuantity"));
            order.setDate(rs.getDate("orderingDate"));
            order.setProductName(rs.getString("productName"));

            return order;
        }
    }
}
