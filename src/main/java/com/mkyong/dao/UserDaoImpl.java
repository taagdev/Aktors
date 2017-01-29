package com.mkyong.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.mkyong.model.User;

@Repository
public class UserDaoImpl implements UserDao {

    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    public User findByName(String name) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", name);

        String sql = "SELECT * FROM users WHERE name=:name";

        User result = namedParameterJdbcTemplate.queryForObject(
                sql,
                params,
                new UserMapper());

        //new BeanPropertyRowMapper(Customer.class));

        return result;

    }

    @Override
    public void removeClient(int id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);

        String sql = "DELETE FROM users WHERE id= :id";
        namedParameterJdbcTemplate.update(sql, params);
    }

    @Override
    public User findById(int id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);

        String sql = "SELECT * FROM users WHERE id=:id";

        User user = namedParameterJdbcTemplate.queryForObject(
                sql,
                params,
                new UserMapper());

        return user;
    }

    @Override
    public List<User> findAll() {

        Map<String, Object> params = new HashMap<String, Object>();

        String sql = "SELECT * FROM users";

        List<User> result = namedParameterJdbcTemplate.query(sql, params, new UserMapper());

        return result;

    }

    @Override
    public void editClient(User user) {
        String sql = "UPDATE users SET name = :name, secondName = :secondName, phonenumber = :phonenumber, country = :country, address = :address  WHERE id = :id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("id", user.getId())
                .addValue("name", user.getName())
                .addValue("secondName", user.getSecondName())
                .addValue("phonenumber", user.getPhonenumber())
                .addValue("country", user.getCountry())
                .addValue("address", user.getAddress());

        namedParameterJdbcTemplate.update(sql, sqlParameterSource);
    }

    @Override
    public void addClient(User user) {
        String sql = "INSERT INTO users (id, name, secondName, phonenumber, country, address) VALUES (:id, :name, :secondName, :phonenumber, :country, :address)";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource()
                .addValue("id", user.getId())
                .addValue("name", user.getName())
                .addValue("secondName", user.getSecondName())
                .addValue("phonenumber", user.getPhonenumber())
                .addValue("country", user.getCountry())
                .addValue("address", user.getAddress());

        namedParameterJdbcTemplate.update(sql, sqlParameterSource);
    }

    private static final class UserMapper implements RowMapper<User> {

        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setSecondName(rs.getString("secondname"));
            user.setPhonenumber(rs.getString("phonenumber"));
            user.setAddress(rs.getString("address"));
            user.setCountry(rs.getString("country"));
            return user;
        }
    }

}