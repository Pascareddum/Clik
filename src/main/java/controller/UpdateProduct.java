package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.User;
import model.dao.ProductDAO;
import model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String category=request.getParameter("category");
        String brand=request.getParameter("brand");
        String image=request.getParameter("image");
        Double price=Double.parseDouble(request.getParameter("price"));
        int id=Integer.parseInt(request.getParameter("id"));

        Product product=new Product();
        product.setName(name);
        product.setCategory(category);
        product.setBrand(brand);
        product.setImage(image);
        product.setPrice(price);
        product.setId(id);

        ProductDAO p=new ProductDAO();
        p.updateProduct(product);

        request.setAttribute("product",product);
        String address="/WEB-INF/admin.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}
