package com.mkyong.dao;

import java.util.List;

import com.mkyong.model.User;

public interface UserDao {

	User findByName(String name);
	void removeClient(int id);
	User findById(int id);
	List<User> findAll();
	void editClient(User user);
	void addClient(User user);

}