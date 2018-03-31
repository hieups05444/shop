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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Shun
 */
public class ProductGET {

    public ProductGET(String code, String name, float fpri) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ProductGET() {

    }

    public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "select * from Products where CategoryID = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID"));
            product.setProductName(rs.getString("Name"));
            product.setProductImage(rs.getString("Image"));
            product.setProductPrice(rs.getDouble("Price"));
            product.setDescription(rs.getString("Description"));
            list.add(product);
        }
        return list;
    }

    public Product getProduct(long productID) throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "select * from Products where ID = '" + productID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) {
            product.setProductID(rs.getLong("ID"));
            product.setProductName(rs.getString("Name"));
            product.setProductImage(rs.getString("Image"));
            product.setProductPrice(rs.getDouble("Price"));
            product.setDescription(rs.getString("Description"));
        }
        return product;
    }

    public ArrayList<Product> getListproduct() throws SQLException {
        Connection connection = ConnectDB.getConnection();
        String sql = "Select * From Products";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("ID"));
            product.setCategoryID(rs.getLong("CategoryID"));
            product.setProductName(rs.getString("Name"));
            product.setProductImage(rs.getString("Image"));
            product.setProductPrice(rs.getDouble("Price"));
            product.setDescription(rs.getString("Description"));
            list.add(product);
        }
        return list;
    }

    public void insert(long ID, long categoryID, String Name, String Image, double Price, String Description) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "insert into Products values(?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setLong(1, ID);
            stm.setLong(2, categoryID);
            stm.setString(3, Name);
            stm.setString(4, Image);
            stm.setDouble(5, Price);
            stm.setString(6, Description);
            stm.executeUpdate();
            stm.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateProduct(Product c) {
        Connection connection = ConnectDB.getConnection();
        String sql = "update Products SET CategoryID = ? , Name = ? , Image = ? , Price = ? , Description = ? where ID = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getProductID());
            ps.setLong(2, c.getCategoryID());
            ps.setString(3, c.getProductName());
            ps.setString(4, c.getProductImage());
            ps.setDouble(4, c.getProductPrice());
            ps.setString(5, c.getDescription());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductGET.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public void deleteProduct(long productID) {
        try {
            Connection connection = ConnectDB.getConnection();
            String sql = "delete from Products where ID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setLong(1, productID);
            stm.executeUpdate();
            stm.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) throws SQLException {
        ProductGET Pget = new ProductGET();
        /*for (Product ds : Pget.getListProductByCategory(1)) {
            System.out.println(ds.getProductID() + " - " + ds.getProductName());
        }*/
        System.out.println(Pget.getProduct(1).getProductName());
    }
}
