package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Service;

@Service
public class regDao {

    @Autowired JdbcTemplate jdbc;

    public String regData(String username, String password,String email, String phone, String role) {
        String SQL = "INSERT INTO users(username,password,email,phone,role) VALUES(? ,?, ? ,?, ?)";
        jdbc.update(SQL, username, password, email, phone, role);
        return "SUCCESS";
    }

    public int getUserAuth(String username, String password) {
        String SQL = "SELECT count(*) FROM users WHERE username = ? AND password = ?";
        return jdbc.queryForObject(SQL, Integer.class, username, password);
    }

    public String createPost(String username, String post) {
        String SQL = "INSERT INTO post(created_by,post) VALUES(? ,?)";
        jdbc.update(SQL, username, post);
        return "SUCCESS";
    }

    public List<Map<String,Object>> viewPost(String username) {
        String SQL = "Select * from post WHERE created_by = ?";
        return jdbc.queryForList(SQL, username);
    }

    public List<Map<String,Object>> viewAllPost() {
        String SQL = "Select * from post ;";
        return jdbc.queryForList(SQL);
    }
    
}
