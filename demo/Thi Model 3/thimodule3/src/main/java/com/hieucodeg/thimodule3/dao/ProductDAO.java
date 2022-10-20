package com.hieucodeg.thimodule3.dao;

import com.hieucodeg.thimodule3.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO{
    private String jdbcURL = "jdbc:mysql://localhost:3306/products?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "MinhHieu";
    private static final String SELECT_ALL = "SELECT * FROM products.category";

    public ProductDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Product> selectAllUsers() {
        List<Product> products = new ArrayList<>();

        try (Connection connection = getConnection();


             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
               int id =rs.getInt("id");
                String name =rs.getString("name");
                int price =rs.getInt("price");
                int quantity = rs.getInt("quantity");
               String color = rs.getString("color");
                 String category =rs.getString("category");
                 products.add(new Product(id,name,price,quantity,color,category));

            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return products;
    }

}
