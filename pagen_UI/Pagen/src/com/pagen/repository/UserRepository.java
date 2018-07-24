package com.pagen.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pagen.util.DbUtil;
public class UserRepository {
    private Connection dbConnection;

    public UserRepository() {
        dbConnection = DbUtil.getConnection();
    }

    public void save(String userName, String password, String emailAddress) {
        try {
            PreparedStatement prepStatement = dbConnection.prepareStatement("insert into users(userName, password, emailAddress) values (?, ?, ?)");
            prepStatement.setString(1, userName);
            prepStatement.setString(2, password);
            prepStatement.setString(3, emailAddress);

            prepStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findByUserName(String userName) {
        try {
            PreparedStatement prepStatement = dbConnection.prepareStatement("select count(*) from users where userName = ?");
            prepStatement.setString(1, userName);

            ResultSet result = prepStatement.executeQuery();
            if (result != null) {
                while (result.next()) {
                    if (result.getInt(1) == 1) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean findByLogin(String userName, String password) {
        try {
            PreparedStatement prepStatement = dbConnection.prepareStatement("select password from users where userName =?");
            prepStatement.setString(1, userName);

            ResultSet result = prepStatement.executeQuery();
            if (result != null) {
                while (result.next()) {
                    if (result.getString(1).equals(password)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
