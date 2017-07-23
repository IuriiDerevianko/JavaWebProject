package ua.itea.javaweb;
import java.sql.*;
import java.util.*;

public class DBWorker {

    private Connection conn = null;
    private Statement st = null;

    public DBWorker() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://localhost/phpmyadmin?"
                + "user=phpmyadmin&password=12345");
        st = conn.createStatement();
    }


    public Product getProduct(int productId) throws SQLException {
        ResultSet rs = st.executeQuery("SELECT id, name, price, description FROM products "
                + "WHERE id = '" + productId + "'");
        if(rs.next()){
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getInt("price"));
            product.setDescription(rs.getString("description"));
            return product;
        }
        return null;
    }


    public List<Product> getProductArray(int categoryId) throws SQLException {
        ResultSet rs = st.executeQuery("SELECT products.id, products.name, products.price, products.description FROM product_to_category "
                + "JOIN products ON product_to_category.product_id=products.id "
                + "JOIN categories ON product_to_category.category_id=categories.id "
                + "WHERE categories.id = '" + categoryId + "'");
        List<Product> productArray = new ArrayList<Product>();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("products.id"));
            product.setName(rs.getString("products.name"));
            product.setPrice(rs.getInt("products.price"));
            product.setDescription(rs.getString("products.description"));
            productArray.add(product);
        }
        return productArray;
    }


    public User checkLogin(String login) throws SQLException {
        ResultSet rs = st.executeQuery("SELECT id FROM users "
                + "WHERE login = '" + login + "'");
        if(rs.next()){
            User user = new User();
            user.setId(rs.getInt("id"));
            return user;
        }
        return null;
    }

    public User getUser(String login, String password) throws SQLException {
        ResultSet rs = st.executeQuery("SELECT id, login, password, name, age, continent, gender, feedback FROM users "
                + "WHERE login = '" + login + "' AND password = '" + password + "'");
        if(rs.next()){
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setLogin(rs.getString("login"));
            user.setPassword(rs.getString("password"));
            user.setName(rs.getString("name"));
            user.setAge(rs.getInt("age"));
            user.setContinent(rs.getString("continent"));
            user.setGender(rs.getString("gender"));
            user.setFeedback(rs.getString("feedback"));
            return user;
        }
        return null;
    }

    public void editUser(User user) throws SQLException {
        String query = "UPDATE users SET login = '" + user.getLogin() + "', password = '" + user.getPassword() + "', name = '" + user.getName()
                + "', age = '" + user.getAge() + "', continent = '" + user.getContinent() + "', gender = '" + user.getGender()
                + "', feedback = '" + user.getFeedback() + "' WHERE id = '" + user.getId() + "'";
        st.execute(query);
    }

    public void addUser(User user) throws SQLException {
        String query = "INSERT INTO users (login, password, name, age, continent, gender, feedback) VALUES('" + user.getLogin() + "','"
                + user.getPassword() + "','" + user.getName() + "','" + user.getAge() + "','" + user.getContinent() + "','" + user.getGender()
                + "','" + user.getFeedback() +"') ";
        st.execute(query);
    }

    public void closeAll() throws SQLException {
        st.close();
        conn.close();
    }
}