package model.dao;
import model.User;

import java.sql.*;

public class UserDAO {




    public User userLogin(String email, String password){

        try(Connection con=ConPool.getConnection()){
            PreparedStatement ps=con.prepareStatement("select * from users where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setSurname(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setAdmin(rs.getBoolean(6));

                return user;
            }

            return null;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(User user) {

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO users (nome,surname,email,password,admin) VALUES(?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, user.getName());
            ps.setString(2, user.getSurname());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setBoolean(5, user.isAdmin());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            user.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isAlreadyRegistered(String email) {

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "SELECT email FROM users WHERE email=?");

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
