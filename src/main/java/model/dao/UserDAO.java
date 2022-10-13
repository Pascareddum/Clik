package model.dao;
import model.User;

import java.sql.*;
import java.util.ArrayList;

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
                    "INSERT INTO users (name,surname,email,password,admin) VALUES(?,?,?,?,?)",
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

    public User doRetrieveById(int id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id, name, surname, email, password,admin FROM users WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setSurname(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setAdmin(rs.getBoolean(6));
                return u;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateUser(User user){

        try(Connection con=ConPool.getConnection()) {
            PreparedStatement ps=con.prepareStatement("UPDATE users SET name=?,surname=?,email=?,password=?,admin=? WHERE id=?;");

            ps.setString(1,user.getName());
            ps.setString(2,user.getSurname());
            ps.setString(3,user.getEmail());
            ps.setString(4,user.getPassword());
            ps.setBoolean(5,user.isAdmin());
            ps.setInt(6,user.getId());

            ps.executeUpdate();
        }

        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<User> doRetriveAll(){
        ArrayList<User> user=new ArrayList<User>();

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT id, name, surname, email, password, admin FROM users");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setSurname(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setAdmin(rs.getBoolean(6));
                user.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
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

    public void resetPassword(String email,String newPassword){
        try(Connection con=ConPool.getConnection()){
            PreparedStatement ps=con.prepareStatement("update users set password = ? where email = ? ");

            ps.setString(1,newPassword);
            ps.setString(2,email);

            ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int delete(int id){
        int i = 0;
        try {
            Connection conn = ConPool.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE from users where id=?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }


}
