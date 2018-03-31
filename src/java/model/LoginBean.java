/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Shun
 */
public class LoginBean implements Serializable {

    private String username;
    private String password;
    private String hoten;
    private String email;
    private boolean roles;

    public LoginBean() {
    }

    public LoginBean(String username, String password, String hoten, String email, boolean roles) {
        this.username = username;
        this.password = password;
        this.hoten = hoten;
        this.email = email;
        this.roles = roles;
    }

    public LoginBean(String username, String password, String hoten) {
        this.username = username;
        this.password = password;
        this.hoten = hoten;
    }

    public LoginBean(String username, String password, boolean roles) {
        this.username = username;
        this.password = password;
        this.roles = roles;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isRoles() {
        return roles;
    }

    public void setRoles(boolean roles) {
        this.roles = roles;
    }

    public void getRoles(boolean roles) {
        this.roles = roles;
    }

    public boolean checkLogin(String username, String password) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Assignment_PS05444";
            Connection con = DriverManager.getConnection(url, "MTHH_PS05444", "123");
            String sql = "select * from Customers where Username = ? and Password = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            boolean result = rs.next();
            rs.close();
            stm.close();
            con.close();
            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insert(String username, String password, String hoten, String email, boolean roles) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Assignment_PS05444";
            Connection con = DriverManager.getConnection(url, "MTHH_PS05444", "123");
            String sql = "insert into Customers values(?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, hoten);
            stm.setString(4, email);
            stm.setBoolean(5, roles);
            int result = stm.executeUpdate();
            stm.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
