/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package getDB;

import connect.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author Shun
 */
public class CategoryGET {

    public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "select * from Category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getInt("ID"));
            category.setCategoryName(rs.getString("Name"));
            list.add(category);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        CategoryGET Cget = new CategoryGET();
        for (Category ds : Cget.getListCategory()) {
            System.out.println(ds.getCategoryID() + " - " + ds.getCategoryName());
        }
    }
}
