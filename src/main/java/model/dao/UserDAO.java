package model.dao;
import model.User;

import java.sql.*;

public class UserDAO {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDAO(Connection con){
            this.con=con;
    }

    public User userLogin(String email, String password){
        User user=null;
        try{
            query="select * from users where email=? and password=?";
            pst=this.con.prepareStatement(query);
            pst.setString(1,email);
            pst.setString(2,password);
            rs = pst.executeQuery();

            if(rs.next()){
                user=new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setEmail(rs.getString("email"));
                user.setAdmin(rs.getBoolean("admin"));
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }

    /*public void doSave(User user) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO customer (firstName, lastName, balance) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, customer.getFirstName());
            ps.setString(2, customer.getLastName());
            ps.setDouble(3, customer.getBalance());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            customer.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/

}
