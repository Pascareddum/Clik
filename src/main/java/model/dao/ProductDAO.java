package model.dao;

import model.Cart;
import model.Product;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class ProductDAO {


    public List<Product> getAllProducts(){
        List<Product> products=new ArrayList<>();
       try(Connection con=ConPool.getConnection()) {
           PreparedStatement ps=con.prepareStatement("select * from products");
           ResultSet rs=ps.executeQuery();
           while (rs.next()){
               Product row=new Product();
               row.setId(rs.getInt("id"));
               row.setName(rs.getString("name"));
               row.setCategory(rs.getString("category"));
               row.setBrand(rs.getString("brand"));
               row.setPrice(rs.getDouble("price"));
               row.setImage(rs.getString("image"));

               products.add(row);
           }
       }catch (Exception e){
           e.printStackTrace();
       }
        return products;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList){
        List<Cart> products=new ArrayList<Cart>();

        try(Connection con=ConPool.getConnection()) {
            if(cartList.size()>0){
                for(Cart item: cartList){
                    PreparedStatement ps=con.prepareStatement("select * from products where id=?");
                    ps.setInt(1,item.getId());
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){
                        Cart row=new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setBrand(rs.getString("brand"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setImage(rs.getString("image"));
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }
                }
            }
        }catch (Exception e){
            System.out.println(e.getMessage());

        }

        return products;
    }

    public Product getSingleProduct(int id){
        Product row=null;

        try(Connection con=ConPool.getConnection()){
            PreparedStatement ps= con.prepareStatement("select * from products where id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                row=new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return row;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList){
        double sum=0;
        try(Connection con=ConPool.getConnection()){
            if(cartList.size()>0){
                for(Cart item:cartList){
                    PreparedStatement ps= con.prepareStatement("select price from products where id=?");
                    ps.setInt(1,item.getId());
                    ResultSet rs=ps.executeQuery();

                    while(rs.next()){
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return sum;
    }

    public ArrayList<Product> doRetriveAll(){
        ArrayList<Product> product=new ArrayList<Product>();

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT id, name, category, brand, price, image FROM products");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setCategory(rs.getString(3));
                p.setBrand(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setImage(rs.getString(6));
                product.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public Product doRetrieveById(int id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT id, name, category, brand, price, image FROM products WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p= new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setCategory(rs.getString(3));
                p.setBrand(rs.getString(4));
                p.setPrice(rs.getDouble(5));
                p.setImage(rs.getString(6));
                return p;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateProduct(Product product){

        try(Connection con=ConPool.getConnection()){
            PreparedStatement ps=con.prepareStatement("UPDATE products SET name=?,category=?,brand=?,price=?,image=? WHERE id=?;");
            ps.setString(1,product.getName());
            ps.setString(2,product.getCategory());
            ps.setString(3,product.getBrand());
            ps.setDouble(4,product.getPrice());
            ps.setString(5,product.getImage());
            ps.setInt(6,product.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public int delete(int id){
        int i = 0;
        try {
            Connection conn = ConPool.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE from products where id=?");
            ps.setInt(1, id);
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
