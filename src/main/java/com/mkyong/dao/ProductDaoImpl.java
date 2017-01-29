package com.mkyong.dao;

import com.mkyong.model.Product;
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
public class ProductDaoImpl implements ProductDao {

    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    public Product sortBy(String name) {
        return null;
    }

    @Override
    public Product findById(int barcode) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("barcode", barcode);

        String sql = "SELECT * FROM products WHERE barcode=:barcode";

        Product result = namedParameterJdbcTemplate.queryForObject(
                sql,
                params,
                new ProductDaoImpl.ProductMapper());

        //new BeanPropertyRowMapper(Customer.class));

        return result;
    }

    @Override
    public void removeProduct(int barcode) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("barcode", barcode);

        String sql = "DELETE FROM products WHERE barcode= :barcode";
        namedParameterJdbcTemplate.update(sql,params);

    }

    @Override
    public List<Product> findAll() {
        Map<String,Object> params = new HashMap<>();
        String sql = "SELECT * FROM products";

        List<Product> result = namedParameterJdbcTemplate.query(sql, params, new ProductMapper());
        return result;
    }

    @Override
    public void addProduct(Product product) {
        String sql = "INSERT INTO products (barcode, name, price, description, releaseDate) VALUES (:barcode, :name, :price, :description, :releaseDate)";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("barcode", product.getBarcode())
                .addValue("name", product.getName())
                .addValue("description", product.getDescription())
                .addValue("price", product.getPrice())
                .addValue("releaseDate", product.getReleaseDate());

        namedParameterJdbcTemplate.update(sql,sqlParameterSource);
    }

    @Override
    public void editProduct(Product product) {
        String sql = "UPDATE products SET name = :name, price = :price, description = :description, releaseDate = :releaseDate WHERE barcode = :barcode";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("barcode", product.getBarcode())
                .addValue("name", product.getName())
                .addValue("description", product.getDescription())
                .addValue("price", product.getPrice())
                .addValue("releaseDate", product.getReleaseDate());

        namedParameterJdbcTemplate.update(sql,sqlParameterSource);
        }




    public static final class ProductMapper implements RowMapper<Product> {
        @Override
        public Product mapRow(ResultSet resultSet, int i) throws SQLException {
            Product product = new Product();
            product.setBarcode(resultSet.getInt("barcode"));
            product.setPrice(resultSet.getDouble("price"));
            product.setDescription(resultSet.getString("description"));
            product.setName(resultSet.getString("name"));
            product.setReleaseDate(resultSet.getString("releaseDate"));

            return product;
        }
    }
}
