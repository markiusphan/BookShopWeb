package com.bookshopweb.service;

import com.bookshopweb.beans.User;
import com.bookshopweb.dao.UserDAO;

import java.util.Optional;

public class UserService extends Service<User, UserDAO> implements UserDAO {
    public UserService() {
        super(UserDAO.class);
    }

    @Override
    public Optional<User> getByUsername(String username) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByUsername(username));
    }
}
